import 'package:flutter/material.dart';

class MyClinet extends StatelessWidget {
  const MyClinet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách lớp học'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: myBody(),
    );
  }

  Widget myBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          block1(),
          const SizedBox(height: 20),
          block2(),
          const SizedBox(height: 20),
          block3(),
          const SizedBox(height: 20),
          block4(),
        ],
      ),
    );
  }

  Widget block1() {
    var tieuDe = "XML và ứng dụng nhóm 1";
    var maLop = "2025-2026.1.Tin4583.001";
    var soLuong = "58 Học viên";
    var anh = "https://images.unsplash.com/photo-1516116216624-53e697fedbea?q=80&w=800&auto=format&fit=crop";
    
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                anh,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tieuDe,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    maLop,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(
                    soLuong,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Icon(Icons.star, color: Colors.red),
          ],
        ),
      ),
    );
  }

  Widget block2() {
    var tieuDe = "Lập trình ứng dụng di động";
    var maLop = "2025-2026.1.Tin4583.001";
    var soLuong = "60 Học viên";
    var anh = "https://images.unsplash.com/photo-1498050108023-c5249f4df085?q=80&w=800&auto=format&fit=crop";
    
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                anh,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tieuDe,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    maLop,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(
                    soLuong,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Icon(Icons.star, color: Colors.red),
          ],
        ),
      ),
    );
  }

  Widget block3() {
    var tieuDe = "Lập trình hướng đối tượng";
    var maLop = "2025-2026.1.Tin4583.001";
    var soLuong = "60 Học viên";
    var anh = "https://images.unsplash.com/photo-1461749280684-dccba630e2f6?q=80&w=800&auto=format&fit=crop";
    
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                anh,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tieuDe,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    maLop,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(
                    soLuong,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Icon(Icons.star, color: Colors.red),
          ],
        ),
      ),
    );
  }

  Widget block4() {
    var tieuDe = "Lập trình phân tán";
    var maLop = "2025-2026.1.Tin4583.001";
    var soLuong = "80 Học viên";
    var anh = "https://images.unsplash.com/photo-1517694712202-14dd9538aa97?q=80&w=800&auto=format&fit=crop";
    
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                anh,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tieuDe,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    maLop,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(
                    soLuong,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Icon(Icons.star, color: Colors.red),
          ],
        ),
      ),
    );
  }
}