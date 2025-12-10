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
