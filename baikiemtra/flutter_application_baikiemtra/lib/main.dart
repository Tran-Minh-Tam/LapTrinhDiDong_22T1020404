import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';   
import 'dart:async';

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
// DỮ LIỆU CẤU TRÚC DỰ ÁN
// ============================================================================
class ProjectData {

  // Hàm tạo cấu trúc chuẩn
  static Map<String, dynamic> createStandardStructure({
    required Map<String, dynamic> libContent, 
    Map<String, dynamic>? assetsContent,
    required String pubspecContent,
  }) {
    return {
      ".dart_tool": { "package_config.json": "..." },
      ".idea": { "workspace.xml": "..." },
      "android": { 
        "app": { "src": { "main": { "AndroidManifest.xml": "<manifest...", "res": "..." } }, "build.gradle": "// Android build" }, 
        "gradle": "wrapper...", 
        "build.gradle": "// Project build"
      },
      "ios": { "Runner": { "Info.plist": "...", "Assets.xcassets": "..." }, "Podfile": "platform :ios" },
      "web": { "index.html": "...", "manifest.json": "..." },
      "test": { "widget_test.dart": "void main() { ... }" },
      "windows": { "runner": "..." },
      "macos": { "Runner": "..." },
      "linux": { "main.cc": "..." },
      if (assetsContent != null) "assets": assetsContent,
      "lib": libContent,
      ".gitignore": "...",
      "analysis_options.yaml": "...",
      "pubspec.yaml": pubspecContent,
      "README.md": "# Readme",
    };
  }

  // ========================================================================
  // BÀI 1: MY HOME PAGE (GIỮ NGUYÊN)
  // ========================================================================
  static final Map<String, dynamic> bai1 = {
    "bai1_myhomepage": createStandardStructure(
      libContent: {
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
      pubspecContent: "name: bai1_myhomepage\ndescription: Bài tập 1..."
    )
  };

  // ========================================================================
  // BÀI 2: MY PLACE (CẬP NHẬT CODE SAHARA CỦA BẠN)
  // ========================================================================
  static final Map<String, dynamic> bai2 = {
    "bai2_myplace": createStandardStructure(
      libContent: {
        "main.dart": """
import 'package:flutter/material.dart';
import 'my_place.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyPlace(),
  ));
}
""",
        "my_place.dart": """
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
"""
      },
      pubspecContent: "name: bai2_myplace"
    )
  };

  // ========================================================================
  // BÀI 3: MY CLIENT (GIỮ NGUYÊN)
  // ========================================================================
  static final Map<String, dynamic> bai3 = {
    "bai3_myclient": createStandardStructure(
      libContent: {
        "main.dart": """
import 'package:flutter/material.dart';
import 'my_clinet.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyClinet(),
  ));
}
""",
        "my_clinet.dart": """
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
"""
      },
      pubspecContent: "name: bai3_myclient"
    )
  };

  // ========================================================================
  // BÀI 4: IMAGE ASSET (GIỮ NGUYÊN)
  // ========================================================================
 static final Map<String, dynamic> bai4 = {
    "bai4_imageasset": createStandardStructure(
      libContent: {
        // 1. File main.dart
        "main.dart": """
import 'package:flutter/material.dart';
import 'screens/simple_place_list.dart';
import 'screens/complex_place_list.dart';

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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Travel Booking"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Bài 1: Danh sách phòng"),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => SimplePlaceList())
                );
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text("Bài 2: Danh sách phòng chi tiết"),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ComplexPlaceList())
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
""",
        // 2. Folder models
        "models": {
          "place.dart": """
class Place {
  final String name;
  final String location;
  final double rating;
  final double price;
  final String imageAsset;
  bool isFavorite;
  final bool hasBreakfast;
  final bool lastRoom;

  Place({
    required this.name,
    required this.location,
    required this.rating,
    required this.price,
    required this.imageAsset,
    this.isFavorite = false,
    this.hasBreakfast = false,
    this.lastRoom = false,
  });
}
"""
        },
        // 3. Folder screens
        "screens": {
          "simple_place_list.dart": """
import 'package:flutter/material.dart';
import '../models/place.dart';
import '../widgets/place_item_simple.dart';

class SimplePlaceList extends StatelessWidget {

  final List<Place> places = [
    Place(
      name: "AnhHill Boutique",
      location: "Huế",
      rating: 9.5,
      price: 109,
      imageAsset: "assets/images/hotel.jpg",
    ),
    Place(
      name: "An Nam Huế Boutique",
      location: "Cự Chính",
      rating: 9.2,
      price: 20,
      imageAsset: "assets/images/room1.jpg",
    ),
    Place(
      name: "Huế Jade Hill Villa",
      location: "Cự Chính",
      rating: 8.0,
      price: 285,
      imageAsset: "assets/images/villa.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Danh Sách Phòng")),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (_, index) {
          return PlaceItemSimple(place: places[index]);
        },
      ),
    );
  }
}
""",
          "complex_place_list.dart": """
import 'package:flutter/material.dart';
import '../models/place.dart';
import '../widgets/place_item_complex.dart';

class ComplexPlaceList extends StatelessWidget {
  final List<Place> places = [
    Place(
    name: "AnhHill Boutique",
    location: "Huế · Cách bạn 0.6km",
    rating: 9.5,
    price: 109,
    imageAsset: "assets/images/hotel.jpg",
    hasBreakfast: true,
    lastRoom: false,
  ),
  Place(
    name: "An Nam Huế Boutique",
    location: "Cự Chính · 0.9km",
    rating: 9.2,
    price: 20,
    imageAsset: "assets/images/room2.jpg",
    hasBreakfast: true,
    lastRoom: true,
  ),
  Place(
    name: "Huế Jade Hill Villa",
    location: "Cự Chính · 1.3km",
    rating: 8.0,
    price: 285,
    imageAsset: "assets/images/villa.jpg",
    hasBreakfast: false,
    lastRoom: false,
  ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Danh Sách Phòng Chi Tiết")),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (_, index) {
          return PlaceItemComplex(place: places[index]);
        },
      ),
    );
  }
}
"""
        },
        // 4. Folder widgets
        "widgets": {
          "place_item_simple.dart": """
import 'package:flutter/material.dart';
import '../models/place.dart';

class PlaceItemSimple extends StatelessWidget {
  final Place place;

  const PlaceItemSimple({required this.place});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      child: Row(
        children: [
          Image.asset(
            place.imageAsset,
            width: 120,
            height: 90,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(place.name,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                Text(place.location),
              ],
            ),
          )
        ],
      ),
    );
  }
}
""",
          "place_item_complex.dart": """
import 'package:flutter/material.dart';
import '../models/place.dart';

class PlaceItemComplex extends StatefulWidget {
  final Place place;

  const PlaceItemComplex({required this.place});

  @override
  State<PlaceItemComplex> createState() => _PlaceItemComplexState();
}

class _PlaceItemComplexState extends State<PlaceItemComplex> {
  @override
  Widget build(BuildContext context) {
    final p = widget.place;

    return Card(
      elevation: 4,
      margin: EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ---------- IMAGE + FAVORITE ----------
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    p.imageAsset,
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  right: 6,
                  top: 6,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        p.isFavorite = !p.isFavorite;
                      });
                    },
                    child: Icon(
                      p.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.redAccent,
                      size: 26,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            // ---------- BREAKFAST BADGE ----------
            if (p.hasBreakfast)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green[600],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "Bao bữa sáng",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),

            SizedBox(height: 6),

            // ---------- NAME ----------
            Text(
              p.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            // ---------- LOCATION ----------
            Text(
              p.location,
              style: TextStyle(color: Colors.grey[700]),
            ),

            SizedBox(height: 6),

            // ---------- RATING ----------
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue[700],
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    p.rating.toString(),
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  p.rating >= 9 ? "Tuyệt vời" : "Rất tốt",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),

            SizedBox(height: 6),

            // ---------- LAST ROOM ----------
            if (p.lastRoom)
              Text(
                "Chỉ còn 1 căn giá này!",
                style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
              ),

            SizedBox(height: 6),

            // ---------- PRICE ----------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Đã bao gồm thuế và phí",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
"""
        }
      },
      assetsContent: {
        "images": {
          "hotel.jpg": "[...]",
          "room1.jpg": "[...]",
          "room2.jpg": "[...]",
          "villa.jpg": "[...]",
        }
      },
      pubspecContent: "name: bai4_imageasset\nflutter:\n  assets:\n    - assets/images/"
    )
  };
  // ========================================================================
  // CÁC BÀI SAU: CẤU TRÚC CHUẨN - CHỜ CODE
  // ========================================================================
 static final Map<String, dynamic> bai5_dem = {
    "bai5_counter": createStandardStructure(
      libContent: {
        "main.dart": """
import 'package:flutter/material.dart';
import 'counter_page.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ứng dụng Đếm số',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CounterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
""",
        "counter_page.dart": """
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _count = 0;

  void _increment() { setState(() { _count++; }); }
  void _decrement() { setState(() { _count--; }); }
  void _reset() { setState(() { _count = 0; }); }

  Color _getColor() {
    if (_count > 0) return Colors.green;
    if (_count < 0) return Colors.red;
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ứng dụng Đếm số'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Giá trị hiện tại:', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text(
              '\$_count',
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: _getColor()),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _decrement, icon: const Icon(Icons.remove), label: const Text('Giảm'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                ),
                const SizedBox(width: 10),
                OutlinedButton.icon(
                  onPressed: _reset, icon: const Icon(Icons.refresh), label: const Text('Đặt lại'),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: _increment, icon: const Icon(Icons.add), label: const Text('Tăng'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
"""
      },
      pubspecContent: "name: bai5_counter"
    )
  };

  static final Map<String, dynamic> bai5_mau = {
    "bai5_color_changer": createStandardStructure(
      libContent: {
        "main.dart": """
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
""",
        "color_changer_page.dart": """
import 'dart:math';
import 'package:flutter/material.dart';

class ColorChangerPage extends StatefulWidget {
  const ColorChangerPage({super.key});

  @override
  State<ColorChangerPage> createState() => _ColorChangerPageState();
}

class _ColorChangerPageState extends State<ColorChangerPage> {
  // Màu mặc định
  Color _backgroundColor = const Color(0xFF8E24AA); // tím
  String _colorName = 'Tím';

  final Random _random = Random();

  // Danh sách màu + tên
  final List<Map<String, dynamic>> _colors = [
    {'color': Colors.purple, 'name': 'Tím'},
    {'color': Colors.blue, 'name': 'Xanh dương'},
    {'color': Colors.green, 'name': 'Xanh lá'},
    {'color': Colors.orange, 'name': 'Cam'},
    {'color': Colors.red, 'name': 'Đỏ'},
    {'color': Colors.teal, 'name': 'Lục lam'},
    {'color': Colors.pink, 'name': 'Hồng'},
    {'color': Colors.indigo, 'name': 'Chàm'},
    {'color': Colors.yellow, 'name': 'Vàng'},
    {'color': Colors.brown, 'name': 'Nâu'},
  ];

  void _changeColorFromList() {
    final index = _random.nextInt(_colors.length);
    setState(() {
      _backgroundColor = _colors[index]['color'] as Color;
      _colorName = _colors[index]['name'] as String;
    });
  }

  void _changeColorRandomARGB() {
    final color = Color.fromARGB(
      255,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
    setState(() {
      _backgroundColor = color;
      _colorName = '#\${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
    });
  }

  void _resetColor() {
    setState(() {
      _backgroundColor = const Color(0xFF8E24AA);
      _colorName = 'Tím';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ứng dụng Đổi màu nền'),
        centerTitle: true,
        backgroundColor: _backgroundColor, // đổi AppBar theo màu nền
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        color: _backgroundColor,
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text(
                'Màu hiện tại',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white70,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                _colorName,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: _changeColorFromList,
                    icon: const Icon(Icons.color_lens),
                    label: const Text('Đổi màu'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  OutlinedButton.icon(
                    onPressed: _resetColor,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Đặt lại'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 12),
                      side: const BorderSide(color: Colors.white70),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              TextButton(
                onPressed: _changeColorRandomARGB,
                child: const Text(
                  'Đổi sang màu hoàn toàn ngẫu nhiên',
                  style: TextStyle(
                    color: Colors.white70,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
"""
      },
      pubspecContent: "name: bai5_color_changer"
    )
  };

  static final Map<String, dynamic> bai5_giay = {
    "bai5_timer": createStandardStructure(
      libContent: {
        "main.dart": """
import 'package:flutter/material.dart';
import 'countdown_timer_page.dart';

void main() {
  runApp(const TimerApp());
}

class TimerApp extends StatelessWidget {
  const TimerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bộ đếm thời gian',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CountdownTimerPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
""",
        "countdown_timer_page.dart": """
import 'dart:async';
import 'package:flutter/material.dart';

class CountdownTimerPage extends StatefulWidget {
  const CountdownTimerPage({super.key});

  @override
  State<CountdownTimerPage> createState() => _CountdownTimerPageState();
}

class _CountdownTimerPageState extends State<CountdownTimerPage> {
  final TextEditingController _controller = TextEditingController();
  Timer? _timer;
  int _seconds = 0;
  bool _isRunning = false;

  void _startTimer() {
    if (_isRunning) return;
    if (_controller.text.isEmpty) return;
    final input = int.tryParse(_controller.text);
    if (input == null || input <= 0) return;

    setState(() {
      _seconds = input;
      _isRunning = true;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          _isRunning = false;
          timer.cancel();
          _showTimeUpDialog();
        }
      });
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _seconds = 0;
      _isRunning = false;
      _controller.clear();
    });
  }

  void _showTimeUpDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('⏰ Hết thời gian!'),
        content: const Text('Bộ đếm đã kết thúc.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "\$minutes:\$secs";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('⏳ Bộ đếm thời gian'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Nhập số giây cần đếm:',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              enabled: !_isRunning,
            ),
            const SizedBox(height: 20),
            Text(
              _formatTime(_seconds),
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _startTimer,
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Bắt đầu'),
                ),
                const SizedBox(width: 16),
                OutlinedButton.icon(
                  onPressed: _resetTimer,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Đặt lại'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
"""
      },
      pubspecContent: "name: bai5_timer"
    )
  };

  static final Map<String, dynamic> bai6 = {
    "bai6_login": createStandardStructure(
      libContent: {
        // 1. main.dart
        "main.dart": """
import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
""",
        // 2. login_page.dart
        "login_page.dart": """
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Đăng nhập"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // TÊN NGƯỜI DÙNG
                  TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      labelText: "Tên người dùng",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Vui lòng nhập tên người dùng";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // MẬT KHẨU
                  TextFormField(
                    controller: passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: "Mật khẩu",
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Vui lòng nhập mật khẩu";
                      }
                      if (value.length < 6) {
                        return "Mật khẩu phải có ít nhất 6 ký tự";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 30),

                  // ===== NÚT ĐĂNG NHẬP =====
                  SizedBox(
                    width: 150,
                    height: 45,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.login),
                      label: const Text("Đăng nhập"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Đăng nhập thành công"),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
""",
        // 3. register_page.dart
        "register_page.dart": """
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Đăng ký tài khoản"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ===== HỌ TÊN =====
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: "Họ tên",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Vui lòng nhập họ tên";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // ===== EMAIL =====
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Vui lòng nhập email";
                      }
                      if (!value.contains("@")) {
                        return "Email không hợp lệ";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // ===== MẬT KHẨU =====
                  TextFormField(
                    controller: passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: "Mật khẩu",
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Vui lòng nhập mật khẩu";
                      }
                      if (value.length < 6) {
                        return "Mật khẩu phải có ít nhất 6 ký tự";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // ===== XÁC NHẬN MẬT KHẨU =====
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: _obscureConfirmPassword,
                    decoration: InputDecoration(
                      labelText: "Xác nhận mật khẩu",
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Vui lòng xác nhận mật khẩu";
                      }
                      if (value != passwordController.text) {
                        return "Mật khẩu không khớp";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),

                  // ===== NÚT ĐĂNG KÝ =====
                  SizedBox(
                    width: 150,
                    height: 45,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.app_registration),
                      label: const Text("Đăng ký"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Đăng ký thành công"),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
"""
      },
      pubspecContent: "name: bai6_login"
    )
  };

  static final Map<String, dynamic> bai7 = {
    "bai7_webapi": createStandardStructure(
      libContent: {
        // 1. main.dart
        "main.dart": """
import 'package:flutter/material.dart';
import 'my_product.dart';

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
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyProduct(),
    );
  }
}
""",
        // 2. api.dart
        "api.dart": """
import 'package:dio/dio.dart';
import 'model/product.dart'; // Sửa lại import cho khớp file trong model

class Api {
  Future<List<Product>> getAllProducts() async {
    var dio = Dio();
    List<Product> lsProduct = [];

    try {
      var response = await dio.request('https://fakestoreapi.com/products');
      
      if(response.statusCode == 200) {
        List ls = response.data;
        lsProduct = ls.map((json) => Product.fromJson(json)).toList();
      } else {
        print('Lỗi kết nối: \${response.statusCode}');
      }
    } catch (e) {
      print('Có lỗi xảy ra: \$e');
    }
    
    return lsProduct; 
  }
}
var test_api = Api();
""",
        // 3. my_product.dart
        "my_product.dart": """
import 'package:flutter/material.dart';
import 'api.dart';
import 'model/product.dart'; // Sửa import cho khớp

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  late Future<List<Product>> _listFuture;

  @override
  void initState() {
    super.initState();
    _listFuture = test_api.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFEE4D2D),
        titleSpacing: 10.0,
        title: Row(
          children: [
            const Text("TamShop", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white)),
            const SizedBox(width: 15),
            Expanded(
              child: Container(
                height: 38,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(2)),
                child: Row(
                  children: [
                    const Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: 10.0), child: Text("TamShop bao ship 0Đ - Đăng ký ngay!", style: TextStyle(color: Colors.grey), overflow: TextOverflow.ellipsis))),
                    Container(width: 50, height: 38, decoration: BoxDecoration(color: const Color(0xFFFB5533), borderRadius: BorderRadius.circular(2)), child: const Icon(Icons.search, color: Colors.white, size: 20)),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 15),
            IconButton(icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 28), onPressed: () {}),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200], 
      body: FutureBuilder<List<Product>>(
        future: _listFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Lỗi: \${snapshot.error}"));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return myGridList(snapshot.data!);
          } else {
            return const Center(child: Text("Không có dữ liệu"));
          }
        },
      ),
    );
  }

  Widget myGridList(List<Product> lsProduct) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.75, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemCount: lsProduct.length,
      itemBuilder: (context, index) => myItem(lsProduct[index]),
    );
  }

  Widget myItem(Product p) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 5, offset: const Offset(0, 3))]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Container(width: double.infinity, padding: const EdgeInsets.all(10), child: Image.network(p.image, fit: BoxFit.contain))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(p.title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500), maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Text('\$\${p.price}', style: const TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Row(children: [const Icon(Icons.star, color: Colors.amber, size: 16), const SizedBox(width: 4), Text('\${p.rating.rate}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)), const SizedBox(width: 4), Text('(\${p.rating.count})', style: const TextStyle(fontSize: 12, color: Colors.grey))])
              ],
            ),
          ),
        ],
      ),
    );
  }
}
""",
        // 4. Folder model
        "model": {
          "product.dart": """
class Product {
  int id;
  String title;
  dynamic price;
  String description;
  String category;
  String image;
  Rating rating;

  Product({
    required this.id, required this.title, required this.price, required this.description,
    required this.category, required this.image, required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      price: json['price'] ?? 0,
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      image: json['image'] ?? '',
      rating: json['rating'] != null ? Rating.fromJson(json['rating']) : Rating(rate: 0.0, count: 0),
    );
  }
}

class Rating {
  dynamic rate;
  int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'] ?? 0,
      count: json['count'] ?? 0,
    );
  }
}
"""
        }
      },
      pubspecContent: "name: bai7_webapi\ndependencies:\n  flutter:\n    sdk: flutter\n  dio: ^5.0.0"
    )
  };

  static final Map<String, dynamic> bai8 = {
    "bai8_news": createStandardStructure(
      libContent: {
        // 1. main.dart
        "main.dart": """
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
""",
        // 2. Folder pages
        "pages": {
          "home_page.dart": """
import 'package:flutter/material.dart';
import '../services/news_service.dart';

class HomePage extends StatefulWidget {
  final bool isDark;
  final VoidCallback toggleTheme;

  const HomePage({super.key, required this.isDark, required this.toggleTheme});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NewsService service = NewsService();
  List<NewsArticle> news = [];
  String category = "business";
  String searchText = "";
  bool loading = true;

  List<String> categories = [
    "business", "technology", "sports", "science", "health", "entertainment"
  ];

  @override
  void initState() {
    super.initState();
    loadNews();
  }

  Future<void> loadNews() async {
    setState(() => loading = true);
    news = await service.fetchNews(category: category, search: searchText);
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("🌍 Tin tức thế giới"),
        actions: [
          IconButton(
            icon: Icon(widget.isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: widget.toggleTheme,
          )
        ],
      ),

      body: Column(
        children: [
          // 🔎 SEARCH BAR
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search news...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
              onSubmitted: (value) {
                searchText = value;
                loadNews();
              },
            ),
          ),

          // 🧩 CATEGORY TABS
          SizedBox(
            height: 45,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: categories.map((c) {
                bool selected = c == category;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: ChoiceChip(
                    label: Text(c.toUpperCase()),
                    selected: selected,
                    onSelected: (_) {
                      category = c;
                      searchText = "";
                      loadNews();
                    },
                  ),
                );
              }).toList(),
            ),
          ),

          // 📌 BODY
          Expanded(
            child: loading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: news.length,
                    itemBuilder: (context, index) {
                      final item = news[index];
                      return GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          "/detail",
                          arguments: item,
                        ),
                        child: Card(
                          margin: EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          elevation: 4,
                          child: Column(
                            children: [
                              if (item.image.isNotEmpty)
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                                  child: Image.network(
                                    item.image,
                                    height: 180,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder: (c, e, s) =>
                                        Container(height: 180, color: Colors.grey.shade300),
                                  ),
                                ),
                              ListTile(
                                title: Text(item.title),
                                subtitle: Text(
                                  item.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
""",
          "detail_page.dart": """
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
"""
        },
        // 3. Folder services
        "services": {
          "news_service.dart": """
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
      image: json["urlToImage"] ?? "",
      content: json["content"] ?? "",
    );
  }
}

class NewsService {
  final String apiKey = "dbd4d0e3d41f4fbeb710ed633ab56611";

  Future<List<NewsArticle>> fetchNews({String category = "general", String search = ""}) async {
    String url =
        "https://newsapi.org/v2/top-headlines?language=en&apiKey=\$apiKey";

    if (category.isNotEmpty) {
      url += "&category=\$category";
    }
    if (search.isNotEmpty) {
      url = "https://newsapi.org/v2/everything?q=\$search&language=en&apiKey=\$apiKey";
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
"""
        }
      },
      // Tự động thêm http vào pubspec.yaml
      pubspecContent: "name: bai8_news\ndependencies:\n  flutter:\n    sdk: flutter\n  http: ^1.1.0"
    )
  };

    static final Map<String, dynamic> bai9 = {
    "bai9_profile": createStandardStructure(
      libContent: {
        // 1. main.dart
        "main.dart": """
import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
""",
        // 2. login_page.dart
        "login_page.dart": """
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'profile_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool loading = false;
  String? errorMessage;

  Future<void> login() async {
    setState(() {
      loading = true;
      errorMessage = null;
    });

    final url = Uri.parse("https://dummyjson.com/auth/login");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": usernameController.text,
        "password": passwordController.text
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ProfilePage(userData: data),
        ),
      );
    } else {
      setState(() {
        errorMessage = data["message"] ?? "Login Failed!";
      });
    }

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 10,
              margin: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text("Login", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    TextField(
                      controller: usernameController,
                      decoration: const InputDecoration(labelText: "Username"),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: "Password"),
                    ),
                    const SizedBox(height: 20),
                    if (errorMessage != null)
                      Text(errorMessage!, style: const TextStyle(color: Colors.red)),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: loading ? null : login,
                      child: loading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text("Login"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
""",
        // 3. profile_page.dart
        "profile_page.dart": """
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final Map<String, dynamic> userData;

  const ProfilePage({super.key, required this.userData});

  Widget buildInfoItem(String label, dynamic value) {
    return ListTile(
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(value?.toString() ?? "Không có dữ liệu"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("\${userData["firstName"]} \${userData["lastName"]}"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Avatar user
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(userData["image"]),
            ),
            const SizedBox(height: 15),

            // FULL NAME
            Text(
              "\${userData["firstName"]} \${userData["lastName"]}",
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            // Username (nickname)
            Text(
              "@\${userData["username"]}",
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),

            const SizedBox(height: 20),

            // GENERAL INFO
            Card(
              elevation: 4,
              child: Column(
                children: [
                  buildInfoItem("Email", userData["email"]),
                  buildInfoItem("Gender", userData["gender"]),
                  buildInfoItem("Age", userData["age"]),
                  buildInfoItem("Phone", userData["phone"]),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ADDRESS
            if (userData["address"] != null) ...[
              const Text("Address", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Card(
                elevation: 4,
                child: Column(
                  children: [
                    buildInfoItem("Street", userData["address"]["address"]),
                    buildInfoItem("City", userData["address"]["city"]),
                    buildInfoItem("State", userData["address"]["state"]),
                    buildInfoItem("Postal Code", userData["address"]["postalCode"]),
                    buildInfoItem("Country", userData["address"]["country"]),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 16),

            // COMPANY
            if (userData["company"] != null) ...[
              const Text("Company", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Card(
                elevation: 4,
                child: Column(
                  children: [
                    buildInfoItem("Name", userData["company"]["name"]),
                    buildInfoItem("Title", userData["company"]["title"]),
                    buildInfoItem("Department", userData["company"]["department"]),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 16),

            // BANK INFO
            if (userData["bank"] != null) ...[
              const Text("Bank Information", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Card(
                elevation: 4,
                child: Column(
                  children: [
                    buildInfoItem("Card Number", userData["bank"]["cardNumber"]),
                    buildInfoItem("Card Type", userData["bank"]["cardType"]),
                    buildInfoItem("Currency", userData["bank"]["currency"]),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 16),

            // CRYPTO
            if (userData["crypto"] != null) ...[
              const Text("Crypto Wallet", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Card(
                elevation: 4,
                child: Column(
                  children: [
                    buildInfoItem("Coin", userData["crypto"]["coin"]),
                    buildInfoItem("Wallet Address", userData["crypto"]["wallet"]),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
"""
      },
      pubspecContent: "name: bai9_profile\ndependencies:\n  flutter:\n    sdk: flutter\n  http: ^1.0.0"
    )
  };
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
  // Mặc định ban đầu là Thông tin sinh viên (Trang chủ)
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
        title: Text(_currentTitle), // Tiêu đề thay đổi theo bài chọn
        backgroundColor: Colors.blue[100],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // HEADER
            UserAccountsDrawerHeader(
              accountName: const Text("Trần Minh Tâm"),
              accountEmail: const Text("22T1020404@husc.edu.vn"),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage("anh/anhnguoi.jpg"),
                backgroundColor: Colors.white,
                child: Text("", style: TextStyle(fontSize: 40.0, color: Colors.blue)),
              ),
              decoration: const BoxDecoration(color: Colors.blue),
            ),
            
            // --- NÚT TRANG CHỦ (MỚI THÊM) ---
            ListTile(
              leading: const Icon(Icons.home, color: Colors.blue), // Icon Ngôi nhà
              title: const Text("Trang chủ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
              onTap: () {
                _selectItem("Thông tin sinh viên", const StudentInfoPage());
              },
            ),
            const Divider(), // Đường kẻ ngăn cách

            // --- DANH SÁCH BÀI TẬP ---
            _buildListTile("Bài 1: My Home Page", 
              LessonDetail(lessonName: "Bài 1", imageFiles: const ["bai1.PNG"], codeData: ProjectData.bai1)),
            
            _buildListTile("Bài 2: My Place", 
              LessonDetail(lessonName: "Bài 2", imageFiles: const ["bai2.PNG"], codeData: ProjectData.bai2)),

            _buildListTile("Bài 3: My Client", 
              LessonDetail(lessonName: "Bài 3", imageFiles: const ["bai3.PNG"], codeData: ProjectData.bai3)),

            _buildListTile("Bài 4: Image Asset", 
              LessonDetail(lessonName: "Bài 4", imageFiles: const ["bai4a.PNG", "bai4b.PNG", "bai4c.PNG"], codeData: ProjectData.bai4)),

            ExpansionTile(
              leading: const Icon(Icons.folder),
              title: const Text("Bài 5: Stateful widget"),
              children: [
                _buildSubTile("Bài Đếm", 
                  LessonDetail(lessonName: "Bài 5 - Đếm", imageFiles: const ["bai5b.PNG", "bai5e.PNG"], codeData: ProjectData.bai5_dem)),
                _buildSubTile("Bài Đổi màu", 
                  LessonDetail(lessonName: "Bài 5 - Đổi màu", imageFiles: const ["bai5a.PNG", "bai5d.PNG"], codeData: ProjectData.bai5_mau)),
                 _buildSubTile("Bài Chuyển giây", 
                  LessonDetail(lessonName: "Bài 5 - Chuyển giây", imageFiles: const ["bai5c.PNG", "bai5f.PNG"], codeData: ProjectData.bai5_giay)),
              ],
            ),

            _buildListTile("Bài 6: Form Login & Register", 
              LessonDetail(lessonName: "Bài 6", imageFiles: const ["bai6a.PNG", "bai6b.PNG", "bai6c.PNG", "bai6d.PNG", "bai6e.PNG"], codeData: ProjectData.bai6)),
            _buildListTile("Bài 7: WebAPI", 
              LessonDetail(lessonName: "Bài 7", imageFiles: const ["bai7a.PNG", "bai7b.PNG"], codeData: ProjectData.bai7)),
            _buildListTile("Bài 8: NewsAPI/ProductsAPI", 
              LessonDetail(lessonName: "Bài 8", imageFiles: const ["bai8a.PNG", "bai8b.PNG", "bai8c.PNG", "bai8d.PNG"], codeData: ProjectData.bai8)),
            _buildListTile("Bài 9: Login and Profile", 
              LessonDetail(lessonName: "Bài 9", imageFiles: const ["bai9a.PNG", "bai9b.PNG"], codeData: ProjectData.bai9)),
            
            const Divider(),
            // Các mục thông tin chung
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