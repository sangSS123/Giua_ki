// lib/exercises/counter_app_widget.dart

import 'package:flutter/material.dart';

// Đã giữ nguyên tên class CounterExercise để khớp với lib/myplace.dart
class CounterExercise extends StatefulWidget {
  const CounterExercise({super.key});

  @override
  State<CounterExercise> createState() => _CounterExerciseState();
}

class _CounterExerciseState extends State<CounterExercise> {
  int count = 0;

  // Hàm tăng giá trị
  void _increase() {
    setState(() {
      count++;
    });
  }

  // Hàm giảm giá trị
  void _decrease() {
    setState(() {
      count--;
    });
  }

  // Hàm đặt lại giá trị về 0
  void _reset() {
    setState(() {
      count = 0;
    });
  }

  // Hàm xác định màu chữ dựa trên giá trị count
  Color _getTextColor() {
    if (count > 0) return Colors.green;
    if (count < 0) return Colors.red;
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
        centerTitle: true,
        backgroundColor: Colors.yellowAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Giá trị hiện tại:", style: TextStyle(fontSize: 22)),
            const SizedBox(height: 10),
            // Hiển thị giá trị count với màu sắc thay đổi
            Text(
              "$count",
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: _getTextColor(),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Nút Giảm
                ElevatedButton.icon(
                  onPressed: _decrease,
                  icon: const Icon(Icons.remove),
                  label: const Text("Giảm"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(110, 50),
                  ),
                ),
                const SizedBox(width: 12),
                // Nút Reset
                ElevatedButton.icon(
                  onPressed: _reset,
                  icon: const Icon(Icons.refresh),
                  label: const Text("Đặt lại"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(110, 50),
                  ),
                ),
                const SizedBox(width: 12),
                // Nút Tăng
                ElevatedButton.icon(
                  onPressed: _increase,
                  icon: const Icon(Icons.add),
                  label: const Text("Tăng"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(110, 50),
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
