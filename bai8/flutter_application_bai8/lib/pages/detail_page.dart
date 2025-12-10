import 'package:flutter/material.dart';
import '../services/news_service.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NewsArticle item =
        ModalRoute.of(context)!.settings.arguments as NewsArticle;

    return Scaffold(
      appBar: AppBar(title: Text(item.title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            if (item.image.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(item.image),
              ),
            SizedBox(height: 12),
            Text(item.content, style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text("Open in browser"),
            )
          ],
        ),
      ),
    );
  }
}
