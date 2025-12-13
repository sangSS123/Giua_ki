import 'package:flutter/material.dart';
import 'dart:math';

// Đổi tên thành ClassroomExercise để phân biệt với tên gốc
class ClassroomExercise extends StatelessWidget {
  const ClassroomExercise({super.key});

  @override
  Widget build(BuildContext context) {
    // CHỈ TRẢ VỀ NỘI DUNG (body) để nhúng vào MyPlace
    return myBody();
  }

  Widget myBody() {
    // Listview thay the đc comlum và row
    return ListView(
      scrollDirection: Axis.vertical, // có thể cuộn
      // Sử dụng 10 mục mẫu
      children: List.generate(10, (index) => item(index)),
    );
  }

  Widget item(int index) {
    String siso = "50 học viên";
    String title = "Lập trình Flutter $index"; // Thêm index để phân biệt
    String subtitle = "TIN1234 - K$index";

    // Tạo random color (Giữ nguyên logic tạo màu ngẫu nhiên của bạn)
    final random = Random();
    final color = Color.fromARGB(
      255,
      random.nextInt(256), // R
      random.nextInt(256), // G
      random.nextInt(256), // B
    );

    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color.withOpacity(
          0.3,
        ), // màu nền random (có thể chỉnh độ trong suốt)
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
