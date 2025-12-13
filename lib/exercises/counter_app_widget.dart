import 'package:flutter/material.dart';

class CounterExercise extends StatefulWidget {
  const CounterExercise({super.key});

  @override
  State<CounterExercise> createState() => _CounterExerciseState();
}

class _CounterExerciseState extends State<CounterExercise> {
  int count = 0;

  void _increase() {
    setState(() {
      count++;
    });
  }

  void _decrease() {
    setState(() {
      count--;
    });
  }

  void _reset() {
    setState(() {
      count = 0;
    });
  }

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
