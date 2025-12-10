import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myBody(),
    );
  }

  Widget myBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Trục chính (dọc): căn đều các khoảng cách
      crossAxisAlignment: CrossAxisAlignment.center, // Trục phụ (ngang): căn giữa
      children: [
        Center(
          child: Text(
            "Xin chào mọi người",
            style: TextStyle(
              color: Colors.red,
              fontSize: 30,
            ),
          ),
        ),
        Icon(
          Icons.heart_broken,
          size: 100,
          color: Colors.red,
        ),
        Center(
          child: Text(
            "Lớp LTDĐ Nhóm 6",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 30,
            ),
          ),
        ),
      ],
    );
  }
}