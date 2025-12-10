import 'package:flutter/material.dart';
import '../services/news_service.dart';

class HomePage extends StatefulWidget {
  final bool isDark;
  final VoidCallback toggleTheme;

  const HomePage({super.key, required this.isDark, required this.toggleTheme});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NewsService service = NewsService();
  List<NewsArticle> news = [];
  String category = "business";
  String searchText = "";
  bool loading = true;

  List<String> categories = [
    "business",
    "technology",
    "sports",
    "science",
    "health",
    "entertainment"
  ];

  @override
  void initState() {
    super.initState();
    loadNews();
  }

  Future<void> loadNews() async {
    setState(() => loading = true);
    news = await service.fetchNews(category: category, search: searchText);
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("🌍 Tin tức thế giới"),
        actions: [
          IconButton(
            icon: Icon(widget.isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: widget.toggleTheme,
          )
        ],
      ),

      body: Column(
        children: [
          // 🔎 SEARCH BAR
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search news...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
              onSubmitted: (value) {
                searchText = value;
                loadNews();
              },
            ),
          ),

          // 🧩 CATEGORY TABS
          SizedBox(
            height: 45,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: categories.map((c) {
                bool selected = c == category;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: ChoiceChip(
                    label: Text(c.toUpperCase()),
                    selected: selected,
                    onSelected: (_) {
                      category = c;
                      searchText = "";
                      loadNews();
                    },
                  ),
                );
              }).toList(),
            ),
          ),

          // 📌 BODY
          Expanded(
            child: loading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: news.length,
                    itemBuilder: (context, index) {
                      final item = news[index];
                      return GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          "/detail",
                          arguments: item,
                        ),
                        child: Card(
                          margin: EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          elevation: 4,
                          child: Column(
                            children: [
                              if (item.image.isNotEmpty)
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                                  child: Image.network(
                                    item.image,
                                    height: 180,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder: (c, e, s) =>
                                        Container(height: 180, color: Colors.grey.shade300),
                                  ),
                                ),
                              ListTile(
                                title: Text(item.title),
                                subtitle: Text(
                                  item.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
