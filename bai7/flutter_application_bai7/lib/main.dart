import 'package:flutter/material.dart';
import 'my_product.dart';   // nhớ import đúng đường dẫn file của bạn

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API Product Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyProduct(),
    );
  }
}
