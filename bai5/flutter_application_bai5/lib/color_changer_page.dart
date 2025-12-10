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
      _colorName =
          '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
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
