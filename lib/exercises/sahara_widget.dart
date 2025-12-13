import 'package:flutter/material.dart';

// Đổi tên thành SaharaExercise để đồng bộ
class SaharaExercise extends StatelessWidget {
  const SaharaExercise({super.key});

  @override
  Widget build(BuildContext context) {
    // CHỈ TRẢ VỀ MyBody() để nhúng vào MyPlace
    // Bọc trong SingleChildScrollView để có thể cuộn nếu nội dung dài hơn màn hình
    return SingleChildScrollView(child: MyBody());
  }

  Widget MyBody() {
    return Column(children: [Block1(), Block2(), Block3(), Block4()]);
  }
}

// Block1: hiển thị hình
Widget Block1() {
  var src =
      "https://images.unsplash.com/photo-1489573280374-2e193c63726c?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
  return Image.network(
    src,
    fit: BoxFit.cover,
    width: double.infinity,
    height: 200,
  );
}

// Block2: hiển thị text
Widget Block2() {
  return Padding(
    padding: const EdgeInsets.all(25.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hoang Mac Sahara",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              "Ben kia ban cau",
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
        Row(
          children: const [
            Icon(Icons.star, color: Colors.red),
            Text("41", style: TextStyle(fontSize: 16)),
          ],
        ),
      ],
    ),
  );
}

Widget Block3() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20.0), // Thêm padding cho đẹp
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Icon(Icons.call, color: Colors.blue),
            Text("CALL", style: TextStyle(color: Colors.blue)),
          ],
        ),
        Column(
          children: [
            Icon(Icons.directions, color: Colors.blue),
            Text("ROUTE", style: TextStyle(color: Colors.blue)),
          ],
        ),
        Column(
          children: [
            Icon(Icons.share, color: Colors.blue),
            Text("SHARE", style: TextStyle(color: Colors.blue)),
          ],
        ),
      ],
    ),
  );
}

Widget Block4() {
  var str =
      "Được bao bọc bởi biển Đại Tây Dương ở phía Tây, dãy núi Atlas và Địa Trung Hải ở phía Bắc, Biển Đỏ (Hồng Hải) và Ai Cập ở phía Đông; Sudan và thung lũng sông Niger ở phía Nam. Điểm cao nhất trong sa mạc là đỉnh núi Emi Koussi với độ cao 3415 m so với mực nước biển, thuộc dãy núi Tibesti phía Bắcnước Tchad.";
  return Padding(
    padding: const EdgeInsets.all(25.0),
    child: Text(
      str,
      textAlign: TextAlign.justify, // Dùng justify cho đoạn văn dài
      style: const TextStyle(fontSize: 16),
    ),
  );
}
