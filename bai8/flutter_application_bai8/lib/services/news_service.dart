import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsArticle {
  final String title;
  final String description;
  final String url;
  final String image;
  final String content;

  NewsArticle({
    required this.title,
    required this.description,
    required this.url,
    required this.image,
    required this.content,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json["title"] ?? "No title",
      description: json["description"] ?? "",
      url: json["url"] ?? "",
      image: json["urlToImage"] ?? "",   // <-- có bài có ảnh có bài không có
      content: json["content"] ?? "",
    );
  }
}

class NewsService {
  final String apiKey = "dbd4d0e3d41f4fbeb710ed633ab56611";

  Future<List<NewsArticle>> fetchNews({String category = "general", String search = ""}) async {
    String url =
        "https://newsapi.org/v2/top-headlines?language=en&apiKey=$apiKey";

    if (category.isNotEmpty) {
      url += "&category=$category";
    }
    if (search.isNotEmpty) {
      url = "https://newsapi.org/v2/everything?q=$search&language=en&apiKey=$apiKey";
    }

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List articles = data["articles"];

      return articles.map((e) => NewsArticle.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load news");
    }
  }
}
