import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bài Tập Lớn Flutter',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const MainScreen(),
    );
  }
}

// ============================================================================
// DỮ LIỆU CẤU TRÚC CODE DỰ ÁN (CHI TIẾT 100% CHO 4 BÀI ĐẦU)
// ============================================================================
class ProjectData {
  
  // --- BÀI 1: MY HOME PAGE (Chi tiết file trong Lib) ---
  static const Map<String, dynamic> bai1 = {
    "flutter_app_bai1": {
      "lib": {
        "main.dart": """
import 'package:flutter/material.dart';
import 'my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LTDĐ Nhóm 6',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
""",
        "my_home_page.dart": """
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Home Page")),
      body: myBody(),
    );
  }

  Widget myBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
      children: [
        const Text("Xin chào, tôi là Trần Minh Tâm", 
          style: TextStyle(fontSize: 20, color: Colors.blue)),
        ElevatedButton(
          onPressed: () {}, 
          child: const Text("Click me")
        ),
      ],
    );
  }
}
"""
      },
      "android": { "app": { "src": "..." }, "build.gradle": "// Android build" },
      "ios": { "Runner": { "Info.plist": "..." } },
      "pubspec.yaml": "name: bai1_myhomepage\ndescription: Bài tập 1\n...",
    }
  };

  // --- BÀI 2: MY PLACE (Chi tiết file trong Lib) ---
  static const Map<String, dynamic> bai2 = {
    "flutter_app_bai2": {
      "lib": {
        "main.dart": """
import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
""",
        "home_page.dart": """
import 'package:flutter/material.dart';
import 'screens/simple_place_list.dart';
import 'screens/complex_place_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Travel Booking")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text("Simple List"),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SimplePlaceList())),
            ),
            // ...
          ],
        ),
      ),
    );
  }
}
""",
        "models": {
          "place.dart": """
class Place {
  final String name;
  final String description;
  final double price;
  final String imagePath;

  Place({required this.name, required this.description, required this.price, required this.imagePath});
}
"""
        },
        "screens": {
          "simple_place_list.dart": "// Code hiển thị danh sách đơn giản...",
          "complex_place_list.dart": "// Code hiển thị danh sách phức tạp..."
        }
      },
      "assets": { "images": { "halong.jpg": "...", "hue.jpg": "..." } },
      "pubspec.yaml": "name: bai2_myplace\nassets:\n  - assets/images/"
    }
  };

  // --- BÀI 3: MY CLIENT (Chi tiết file trong Lib) ---
  static const Map<String, dynamic> bai3 = {
    "flutter_app_bai3": {
      "lib": {
        "main.dart": """
import 'package:flutter/material.dart';
import 'screens/client_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ClientScreen(),
  ));
}
""",
        "models": {
          "client.dart": """
class Client {
  String id;
  String name;
  String email;
  String phone;

  Client({required this.id, required this.name, required this.email, required this.phone});
}
"""
        },
        "screens": {
          "client_screen.dart": """
import 'package:flutter/material.dart';
import '../models/client.dart';

class ClientScreen extends StatefulWidget {
  @override
  _ClientScreenState createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  final List<Client> clients = [
    Client(id: "1", name: "Nguyễn Văn A", email: "a@gmail.com", phone: "0123456789"),
  ];
  // ... Code hiển thị list view
}
"""
        }
      },
      "pubspec.yaml": "name: bai3_myclient"
    }
  };

  // --- BÀI 4: IMAGE ASSET (CẤU TRÚC FOLDER TỪ RAR + CODE TỪ DOCX) ---
  static const Map<String, dynamic> bai4 = {
    "bai4": {
      ".dart_tool": { "package_config.json": "..." },
      ".idea": { "workspace.xml": "..." },
      "android": { 
        "app": { 
          "src": { 
            "main": { 
              "java": "...", 
              "res": "...", 
              "AndroidManifest.xml": "<manifest..." 
            } 
          },
          "build.gradle": "// Android app build"
        }, 
        "gradle": "...", 
        "build.gradle": "// Project build"
      },
      "assets": {
        "images": { 
          "room2.jpg": "[Image Binary]", 
          "villa.jpg": "[Image Binary]" 
        }
      },
      "ios": { "Runner": { "Info.plist": "...", "Assets.xcassets": "..." } },
      "lib": {
        "main.dart": """
import 'package:flutter/material.dart';

void main() => runApp(const ImageAssetApp());

class ImageAssetApp extends StatelessWidget {
  const ImageAssetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Bài 4: Image Assets")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Ảnh 1: Villa", style: TextStyle(fontSize: 18)),
              ),
              Image.asset('assets/images/villa.jpg'),
              
              const Divider(),
              
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Ảnh 2: Room", style: TextStyle(fontSize: 18)),
              ),
              Image.asset('assets/images/room2.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}
"""
      },
      "linux": { "flutter": "...", "main.cc": "..." },
      "macos": { "Runner": "..." },
      "test": { "widget_test.dart": "..." },
      "web": { "index.html": "..." },
      "windows": { "runner": "..." },
      ".gitignore": "...",
      "analysis_options.yaml": "...",
      "pubspec.yaml": """
name: bai4
description: "A new Flutter project."
version: 1.0.0+1
dependencies:
  flutter:
    sdk: flutter
flutter:
  assets:
    - assets/images/
"""
    }
  };

  // Các bài sau (Placeholder - Chờ bạn gửi nốt)
  static const Map<String, dynamic> bai5_dem = { "lib": {"main.dart": "// Code bài 5 Đếm"} };
  static const Map<String, dynamic> bai5_mau = { "lib": {"main.dart": "// Code bài 5 Màu"} };
  static const Map<String, dynamic> bai5_giay = { "lib": {"main.dart": "// Code bài 5 Giây"} };
  static const Map<String, dynamic> bai6 = { "lib": {"main.dart": "// Code bài 6 Login"} };
  static const Map<String, dynamic> bai7 = { "lib": {"main.dart": "// Code bài 7 WebAPI"} };
  static const Map<String, dynamic> bai8 = { "lib": {"main.dart": "// Code bài 8 News"} };
  static const Map<String, dynamic> bai9 = { "lib": {"main.dart": "// Code bài 9 Profile"} };
}

// ============================================================================
// MÀN HÌNH CHÍNH
// ============================================================================

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _currentTitle = "Thông tin sinh viên";
  Widget _currentBody = const StudentInfoPage();

  void _selectItem(String title, Widget body) {
    setState(() {
      _currentTitle = title;
      _currentBody = body;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bài kiểm tra"),
        backgroundColor: Colors.blue[100],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("Trần Minh Tâm"),
              accountEmail: const Text("22T1020404@husc.edu.vn"),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage("anh/avatar.jpg"),
                backgroundColor: Colors.white,
                child: Text("T", style: TextStyle(fontSize: 40.0, color: Colors.blue)),
              ),
              decoration: const BoxDecoration(color: Colors.blue),
            ),
            
            _buildListTile("Bài 1: My Home Page", 
              const LessonDetail(lessonName: "Bài 1", imageFiles: ["bai1.PNG"], codeData: ProjectData.bai1)),
            
            _buildListTile("Bài 2: My Place", 
              const LessonDetail(lessonName: "Bài 2", imageFiles: ["bai2.PNG"], codeData: ProjectData.bai2)),

            _buildListTile("Bài 3: My Client", 
              const LessonDetail(lessonName: "Bài 3", imageFiles: ["bai3.PNG"], codeData: ProjectData.bai3)),

            _buildListTile("Bài 4: Image Asset", 
              const LessonDetail(lessonName: "Bài 4", imageFiles: ["bai4a.PNG", "bai4b.PNG"], codeData: ProjectData.bai4)),

            ExpansionTile(
              leading: const Icon(Icons.folder),
              title: const Text("Bài 5: Stateful widget"),
              children: [
                _buildSubTile("Bài Đếm", 
                  const LessonDetail(lessonName: "Bài 5 - Đếm", imageFiles: ["bai5a.PNG"], codeData: ProjectData.bai5_dem)),
                _buildSubTile("Bài Đổi màu", 
                  const LessonDetail(lessonName: "Bài 5 - Đổi màu", imageFiles: ["bai5b.PNG"], codeData: ProjectData.bai5_mau)),
                 _buildSubTile("Bài Chuyển giây", 
                  const LessonDetail(lessonName: "Bài 5 - Chuyển giây", imageFiles: ["bai5c.PNG"], codeData: ProjectData.bai5_giay)),
              ],
            ),

            _buildListTile("Bài 6: Form Login & Register", 
              const LessonDetail(lessonName: "Bài 6", imageFiles: ["bai6a.PNG", "bai6b.PNG"], codeData: ProjectData.bai6)),
            _buildListTile("Bài 7: WebAPI", 
              const LessonDetail(lessonName: "Bài 7", imageFiles: ["bai7a.PNG", "bai7b.PNG"], codeData: ProjectData.bai7)),
            _buildListTile("Bài 8: NewsAPI/ProductsAPI", 
              const LessonDetail(lessonName: "Bài 8", imageFiles: ["bai8a.PNG", "bai8b.PNG"], codeData: ProjectData.bai8)),
            _buildListTile("Bài 9: Login and Profile", 
              const LessonDetail(lessonName: "Bài 9", imageFiles: ["bai9a.PNG", "bai9b.PNG"], codeData: ProjectData.bai9)),
            
            const Divider(),
            _buildListTile("Thông tin học phần", const CourseInfoPage()),
            _buildListTile("Thông tin sinh viên", const StudentInfoPage()),
          ],
        ),
      ),
      body: _currentBody,
    );
  }

  Widget _buildListTile(String title, Widget body) {
    return ListTile(
      leading: const Icon(Icons.book),
      title: Text(title),
      onTap: () => _selectItem(title, body),
    );
  }

  Widget _buildSubTile(String title, Widget body) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 40),
      leading: const Icon(Icons.subdirectory_arrow_right),
      title: Text(title),
      onTap: () => _selectItem(title, body),
    );
  }
}

class LessonDetail extends StatelessWidget {
  final String lessonName;
  final List<String> imageFiles;
  final Map<String, dynamic>? codeData;

  const LessonDetail({
    super.key, 
    required this.lessonName, 
    required this.imageFiles, 
    this.codeData
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Text("Chi tiết: $lessonName", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          
          _buildActionCard(
            context,
            icon: Icons.code,
            title: "Code dự án",
            subtitle: "Xem mã nguồn",
            onTap: () {
              final dataToShow = codeData ?? {"Lỗi": "Chưa có dữ liệu code"};
              Navigator.push(context, MaterialPageRoute(builder: (context) => CodeExplorerPage(structure: dataToShow, title: lessonName)));
            },
          ),
          
          _buildActionCard(
            context,
            icon: Icons.image,
            title: "Ảnh chạy dự án",
            subtitle: "Xem demo kết quả",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ImageViewerPage(images: imageFiles)));
            },
          ),

          _buildActionCard(
            context,
            icon: Icons.link,
            title: "GitHub",
            subtitle: "Truy cập repository",
            onTap: () async {
              final Uri url = Uri.parse("https://github.com/Tran-Minh-Tam/LapTrinhDiDong_22T1020404.git");
              if (!await launchUrl(url)) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Không thể mở liên kết")));
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard(BuildContext context, {required IconData icon, required String title, required String subtitle, required VoidCallback onTap}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.blue[50],
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(backgroundColor: Colors.blue, child: Icon(icon, color: Colors.white)),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(subtitle, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              const Icon(Icons.more_vert),
            ],
          ),
        ),
      ),
    );
  }
}

class CodeExplorerPage extends StatelessWidget {
  final Map<String, dynamic> structure;
  final String title;

  const CodeExplorerPage({super.key, required this.structure, required this.title});

  @override
  Widget build(BuildContext context) {
    final keys = structure.keys.toList();
    keys.sort((a, b) {
      bool isFolderA = structure[a] is Map;
      bool isFolderB = structure[b] is Map;
      if (isFolderA && !isFolderB) return -1;
      if (!isFolderA && isFolderB) return 1;
      return a.compareTo(b);
    });

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemCount: keys.length,
        itemBuilder: (context, index) {
          final key = keys[index];
          final value = structure[key];
          final isFolder = value is Map<String, dynamic>; 
          
          return Column(
            children: [
              ListTile(
                leading: Icon(
                  isFolder ? Icons.folder : Icons.insert_drive_file,
                  color: isFolder ? Colors.amber : Colors.blueGrey,
                ),
                title: Text(key),
                trailing: isFolder ? const Icon(Icons.chevron_right) : null,
                onTap: () {
                  if (isFolder) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CodeExplorerPage(structure: value, title: key),
                      ),
                    );
                  } else {
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SourceCodeViewPage(fileName: key, content: value.toString()),
                      ),
                    );
                  }
                },
              ),
              const Divider(height: 1),
            ],
          );
        },
      ),
    );
  }
}

class SourceCodeViewPage extends StatelessWidget {
  final String fileName;
  final String content;

  const SourceCodeViewPage({super.key, required this.fileName, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(fileName)),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFF1E1E1E), 
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: SelectableText(
            content,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Courier', 
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

class ImageViewerPage extends StatelessWidget {
  final List<String> images;
  const ImageViewerPage({super.key, required this.images});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ảnh chạy dự án")),
      body: images.isEmpty 
          ? const Center(child: Text("Chưa có ảnh demo cho bài này"))
          : GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 0.7,
              ),
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset("anh/${images[index]}", fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => const Center(child: Icon(Icons.broken_image))),
                      ),
                      Padding(padding: const EdgeInsets.all(8.0), child: Text(images[index], style: const TextStyle(fontSize: 12))),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

class StudentInfoPage extends StatelessWidget {
  const StudentInfoPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Thông tin sinh viên", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue)),
              Divider(),
              Text("Tên: Trần Minh Tâm", style: TextStyle(fontSize: 16)),
              Text("MSV: 22T1020404", style: TextStyle(fontSize: 16)),
              Text("Giới tính: Nam", style: TextStyle(fontSize: 16)),
              Text("Ngày sinh: 09/11/2004", style: TextStyle(fontSize: 16)),
              Text("Email: tranminhtamk46@gmail.com", style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}

class CourseInfoPage extends StatelessWidget {
  const CourseInfoPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Thông tin học phần", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue)),
              Divider(),
              Text("Tên HP: Lập trình ứng dụng cho các thiết bị di động - Nhóm 6"),
              Text("Mã HP: 2025-2026.1.TIN4403.006"),
              Text("Số tín chỉ: 3"),
              Text("Giảng viên: Nguyễn Dũng"),
              Text("Đơn vị: Khoa Công nghệ thông tin"),
            ],
          ),
        ),
      ),
    );
  }
}