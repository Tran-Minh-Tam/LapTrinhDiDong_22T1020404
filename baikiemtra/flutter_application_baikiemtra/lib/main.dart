import 'package:flutter/material.dart';

// 1. NÂNG CẤP MODEL: Thêm trường 'content' để lưu nội dung bài học
class Lesson {
  final String title;    // Tên bài (hiện ở Menu)
  final String content;  // Nội dung chi tiết (hiện ở màn hình trong)

  Lesson({required this.title, required this.content});
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dynamic Drawer',
      theme: ThemeData(primarySwatch: Colors.blue),
      
      // 2. ROUTE: Chỉ cần khai báo 1 route chi tiết duy nhất
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/details': (context) => const DetailScreen(), // Màn hình dùng chung
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 3. DATA STORE: Lưu tất cả bài học tại đây (đúng ý bạn muốn)
  // Sau này có thể tách cái List này ra một file riêng (data.dart) cho gọn
  final List<Lesson> lessons = [
    Lesson(
      title: "Bài 1: Giới thiệu Flutter", 
      content: "Flutter là UI Toolkit của Google...\nGiúp build ứng dụng đa nền tảng.",
    ),
    Lesson(
      title: "Bài 2: Dart cơ bản", 
      content: "Dart là ngôn ngữ lập trình hướng đối tượng...\nCó cú pháp giống C/Java.",
    ),
    Lesson(
      title: "Bài 3: Widget Tree", 
      content: "Mọi thứ trong Flutter đều là Widget.\nChúng được sắp xếp theo dạng cây (Tree).",
    ),
    // Bạn có thể thêm Bài 4, 5... thoải mái mà không cần sửa code giao diện
    Lesson(
      title: "Bài 4: State Management",
      content: "Quản lý trạng thái là phần quan trọng nhất...",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Danh sách bài học")),
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Sinh Viên"),
              accountEmail: Text("code@hoclaptrinh.com"),
              currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: lessons.length,
                itemBuilder: (context, index) {
                  final item = lessons[index];
                  return ListTile(
                    leading: const Icon(Icons.book_outlined),
                    title: Text(item.title),
                    onTap: () {
                      Navigator.pop(context); // Đóng drawer
                      
                      // 4. TRUYỀN DỮ LIỆU (Arguments)
                      // Khi chuyển trang, ta "gửi" gói dữ liệu (item) đi theo
                      Navigator.pushNamed(
                        context, 
                        '/details', 
                        arguments: item // <--- Mấu chốt nằm ở đây
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: const Center(child: Text("Chọn một bài học từ Menu")),
    );
  }
}

// 5. MÀN HÌNH CHI TIẾT (Nhận dữ liệu động)
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lấy dữ liệu được gửi từ màn hình trước
    // Dòng này "bóc" gói arguments ra và ép kiểu về Lesson
    final lesson = ModalRoute.of(context)!.settings.arguments as Lesson;

    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.title), // Tiêu đề tự động đổi theo bài
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              lesson.title, 
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
            ),
            const SizedBox(height: 16),
            Text(
              lesson.content, // Nội dung tự động đổi theo bài
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}