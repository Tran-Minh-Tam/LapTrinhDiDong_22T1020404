import 'package:flutter/material.dart';
import 'color_changer_page.dart'; // import file mới

void main() {
  runApp(const ColorChangerApp());
}

class ColorChangerApp extends StatelessWidget {
  const ColorChangerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ứng dụng Đổi màu nền',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const ColorChangerPage(), // gọi đến trang bên ngoài
      debugShowCheckedModeBanner: false,
    );
  }
}
