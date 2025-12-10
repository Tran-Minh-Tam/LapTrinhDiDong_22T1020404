import 'package:flutter/material.dart';

class MyPlace extends StatelessWidget {
  const MyPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myBody(),
    );
  }

  Widget myBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          block1(),
          block2(),
          block3(),
          block4(),
        ],
      ),
    );
  }

  // Block 1: Hình ảnh
  Widget block1() {
    var src = "https://images.unsplash.com/photo-1559586616-361e18714958?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    return Image.network(
      src,
      width: double.infinity,
      height: 250,
      fit: BoxFit.cover,
    );
  }

  // Block 2: Tiêu đề và đánh giá
  Widget block2() {
    var title = "Hoang mạc Sahara";
    var subTitle = "Phía bắc châu Phi";
    
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subTitle,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: const [
              Icon(Icons.star, color: Colors.red, size: 24),
              SizedBox(width: 4),
              Text(
                "41",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Block 3: Các nút hành động
  Widget block3() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildActionButton(Icons.phone, "CALL", Colors.blue),
          _buildActionButton(Icons.navigation, "ROUTE", Colors.blue),
          _buildActionButton(Icons.share, "SHARE", Colors.blue),
        ],
      ),
    );
  }

  // Widget phụ cho các nút hành động
  Widget _buildActionButton(IconData icon, String label, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 30),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // Block 4: Mô tả nội dung
  Widget block4() {
    var content = "Sa mạc Sahara là sa mạc nóng lớn nhất thế giới, nằm ở phía bắc châu Phi với diện tích hơn 9 triệu km², bao gồm nhiều đụn cát khổng lồ, cao nguyên đá, thung lũng khô cằn và các ốc đảo xanh tươi.";
    
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        content,
        textAlign: TextAlign.justify,
        style: const TextStyle(
          fontSize: 16,
          height: 1.5,
        ),
      ),
    );
  }
}