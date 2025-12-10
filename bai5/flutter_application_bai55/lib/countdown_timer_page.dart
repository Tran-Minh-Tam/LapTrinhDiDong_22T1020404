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
    _timer?.cancel(); // tránh rò rỉ bộ nhớ
    _controller.dispose();
    super.dispose();
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
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
