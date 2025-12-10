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
