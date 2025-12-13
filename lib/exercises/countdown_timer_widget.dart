import 'dart:async';
import 'package:flutter/material.dart';

class CountdownExercise extends StatefulWidget {
  const CountdownExercise({super.key});

  @override
  State<CountdownExercise> createState() => _CountdownExerciseState();
}

class _CountdownExerciseState extends State<CountdownExercise> {
  // Đơn vị giây (2 phút = 120 giây)
  static const int _initialSeconds = 120;
  int _seconds = _initialSeconds;
  Timer? _timer;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    // Bắt đầu đếm ngược ngay khi widget được tạo (tùy chọn)
    // _startTimer();
  }

  void _startTimer() {
    if (_isRunning) return; // tránh chạy nhiều timer
    setState(() => _isRunning = true);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          _stopTimer();
          _showTimeUpDialog();
        }
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    setState(() => _isRunning = false);
  }

  void _resetTimer() {
    _stopTimer();
    setState(() => _seconds = _initialSeconds);
  }

  void _showTimeUpDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("⏰ Hết thời gian!"),
        content: const Text("Thời gian đếm ngược đã kết thúc."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  // Định dạng thời gian sang MM:SS
  String _formatTime(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return "${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}";
  }

  // Rất quan trọng: Hủy Timer khi widget bị hủy để tránh rò rỉ bộ nhớ
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Countdown Time"),
        centerTitle: true,
        backgroundColor: Colors.indigo, // Đổi màu AppBar cho dễ nhận diện
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Đếm ngược 2 phút", style: TextStyle(fontSize: 22)),
            const SizedBox(height: 40),
            // Hiển thị thời gian đếm ngược
            Text(
              _formatTime(_seconds),
              style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.bold,
                color: _seconds <= 10
                    ? Colors.red
                    : Colors.green, // Đổi màu khi gần hết giờ
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Nút Start/Pause (Start chỉ hoạt động khi không chạy)
                ElevatedButton.icon(
                  onPressed: _isRunning
                      ? _stopTimer
                      : _startTimer, // Chuyển thành nút Start/Stop
                  icon: Icon(_isRunning ? Icons.pause : Icons.play_arrow),
                  label: Text(_isRunning ? "Pause" : "Start"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isRunning ? Colors.orange : Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                // Nút Restart
                ElevatedButton.icon(
                  onPressed: _resetTimer,
                  icon: const Icon(Icons.refresh),
                  label: const Text("Restart"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
