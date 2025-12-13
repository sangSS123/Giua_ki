import 'dart:math';
import 'package:flutter/material.dart';

class ChangeColorExercise extends StatefulWidget {
  const ChangeColorExercise({super.key});
  @override
  State<ChangeColorExercise> createState() => _ChangeColorExerciseState();
}

class _ChangeColorExerciseState extends State<ChangeColorExercise> {
  Color bgColor = Colors.pink;

  final List<Color> lsColor = const [
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.pink,
    Colors.teal,
    Colors.cyan,
  ];

  @override
  void initState() {
    super.initState();

    bgColor = Colors.pink;
  }

  void _changeRandomColor() {
    setState(() {
      var random = Random();

      Color newColor;
      do {
        newColor = lsColor[random.nextInt(lsColor.length)];
      } while (newColor == bgColor);

      bgColor = newColor;
    });
  }

  void _resetColor() {
    setState(() {
      bgColor = Colors.pink;
    });
  }

  String _getColorName(Color color) {
    if (color == Colors.red) return "Đỏ";
    if (color == Colors.yellow) return "Vàng";
    if (color == Colors.blue) return "Xanh Dương";
    if (color == Colors.pink) return "Hồng";
    if (color == Colors.teal) return "Xanh Ngọc";
    if (color == Colors.cyan) return "Xanh Lơ";
    return "Màu Khác";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Color App"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        color: bgColor,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Màu hiện tại:",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 2.0,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                _getColorName(bgColor),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 4.0,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: _changeRandomColor,
                    icon: const Icon(Icons.color_lens),
                    label: const Text("Change"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(140, 50),
                    ),
                  ),
                  const SizedBox(width: 15),

                  ElevatedButton.icon(
                    onPressed: _resetColor,
                    icon: const Icon(Icons.refresh),
                    label: const Text("Restart"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(140, 50),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
