import 'package:flutter/material.dart';

class MyHomeExercise extends StatelessWidget {
  const MyHomeExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return myBody();
  }

  Widget myBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Xin chào con người',
            style: TextStyle(color: Colors.red, fontSize: 60),
            textAlign: TextAlign.center,
          ),
          const Icon(Icons.heart_broken, color: Colors.red, size: 150),
          const Text(
            "Chúng tôi là lớp LTDĐ - Nhóm 5 ",
            style: TextStyle(color: Colors.blue, fontSize: 60),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
