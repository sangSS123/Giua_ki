import 'package:flutter/material.dart';
import 'dart:math';

class ClassroomExercise extends StatelessWidget {
  const ClassroomExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return myBody();
  }

  Widget myBody() {
    return ListView(
      scrollDirection: Axis.vertical,
      children: List.generate(10, (index) => item(index)),
    );
  }

  Widget item(int index) {
    String siso = "50 học viên";
    String title = "Lập trình Flutter $index";
    String subtitle = "TIN1234 - K$index";

    final random = Random();
    final color = Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );

    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(subtitle, style: TextStyle(color: Colors.grey.shade700)),
                ],
              ),
              Text(
                siso,
                style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
              ),
            ],
          ),
          IconButton(onPressed: null, icon: const Icon(Icons.more_horiz)),
        ],
      ),
    );
  }
}
