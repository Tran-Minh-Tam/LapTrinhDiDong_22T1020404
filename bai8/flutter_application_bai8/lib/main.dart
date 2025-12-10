import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/detail_page.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "News App",
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      routes: {
        "/": (ctx) => HomePage(
              isDark: isDark,
              toggleTheme: () {
                setState(() {
                  isDark = !isDark;
                });
              },
            ),
        "/detail": (ctx) => const DetailPage(),
      },
    );
  }
}
