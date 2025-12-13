// lib/myplace.dart

import 'package:flutter/material.dart';

// ------------------------------------------------------------------
// CÁC IMPORTS BÀI TẬP (Giữ nguyên)
// ------------------------------------------------------------------
import 'package:giua_ki/exercises/classroom_widget.dart';
import 'package:giua_ki/exercises/countdown_timer_widget.dart';
import 'package:giua_ki/exercises/myhome_widget.dart';
import 'package:giua_ki/exercises/sahara_widget.dart';
import 'package:giua_ki/exercises/travel_layout_widget.dart';
import 'package:giua_ki/exercises/product_list_widget.dart';
import 'package:giua_ki/exercises/change_color_widget.dart';
import 'package:giua_ki/exercises/counter_app_widget.dart';
import 'package:giua_ki/exercises/login_form_widget.dart';
import 'package:giua_ki/exercises/register_form_widget.dart';
import 'package:giua_ki/exercises/ecommerce_product_grid_widget.dart';
import 'package:giua_ki/exercises/home_screen.dart';
import 'package:giua_ki/exercises/login_api_exercise.dart';

// ------------------------------------------------------------------
// WIDGET CHÍNH: MYPLACE (Tối Ưu Kích Thước)
// ------------------------------------------------------------------

class MyPlace extends StatefulWidget {
  const MyPlace({super.key});

  @override
  State<MyPlace> createState() => _MyPlaceState();
}

class _MyPlaceState extends State<MyPlace> {
  // Danh sách bài tập (Đã thêm Icon)
  final List<Map<String, dynamic>> exercises = [
    {'title': 'Myhome', 'icon': Icons.home_rounded},
    {'title': 'Classroom', 'icon': Icons.class_rounded},
    {'title': 'Sahara', 'icon': Icons.landscape},
    {'title': 'MyLayout', 'icon': Icons.dashboard_customize},
    {'title': 'Khách sạn', 'icon': Icons.hotel},
    {'title': 'Change color app', 'icon': Icons.color_lens},
    {'title': 'Counter app', 'icon': Icons.exposure_plus_1},
    {'title': 'Countdown time', 'icon': Icons.timer},
    {'title': 'Login form', 'icon': Icons.login},
    {'title': 'Register form', 'icon': Icons.app_registration},
    {'title': 'Fake Store', 'icon': Icons.store},
    {'title': 'News', 'icon': Icons.article},
    {'title': 'Profile', 'icon': Icons.person},
  ];

  String _selectedExercise = 'Chào mừng bạn đến với ứng dụng ';

  Widget _buildContent(String title) {
    switch (title) {
      // ----------------------------------------------------
      // CÁC CASE TRẢ VỀ WIDGET BÀI TẬP (GIỮ NGUYÊN)
      // ----------------------------------------------------
      case 'Myhome':
        return const MyHomeExercise();
      case 'Classroom':
        return const ClassroomExercise();
      case 'Sahara':
        return const SaharaExercise();
      case 'MyLayout':
        return const TravelLayoutExercise();
      case 'Khách sạn':
        return const ProductListExercise();
      case 'Change color app':
        return const ChangeColorExercise();
      case 'Counter app':
        return const CounterExercise();
      case 'Countdown time':
        return const CountdownExercise();
      case 'Login form':
        return const LoginExercise();
      case 'Register form':
        return const RegisterExercise();
      case 'Fake Store':
        return const EcommerceProductGridExercise();
      case 'News':
        return HomeScreen();
      case 'Profile':
        return const LoginPage();

      default:
        // Nội dung mặc định cho màn hình chào mừng
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.menu_book,
                  size: 60,
                  color: Colors.teal.shade700,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Chào mừng bạn đến với Flutter Workspace',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Vui lòng chọn một bài tập từ Menu bên trái \nđể xem kết quả.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 30),
            ],
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: const Text(
          'FLUTTER WORKSPACE',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20,
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: Colors.teal.shade700,
        foregroundColor: Colors.white,
        elevation: 8,
        shadowColor: Colors.teal.shade900,
      ),
      body: Row(
        children: <Widget>[
          // CỘT TRÁI (MENU) - Chiếm 30%
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: Colors.grey.shade200, width: 1),
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                  child: Text(
                    'Toàn bộ bài thực hành',
                    style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),

                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Color(0xFFE0E0E0),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: exercises.length,
                    itemBuilder: (context, index) {
                      final item = exercises[index];
                      final exerciseTitle = item['title'] as String;
                      final isSelected = _selectedExercise == exerciseTitle;

                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.teal.shade50
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          selected: isSelected,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 0,
                          ),
                          leading: Icon(
                            item['icon'] as IconData,
                            color: isSelected
                                ? Colors.teal.shade700
                                : Colors.grey.shade600,
                          ),
                          title: Text(
                            exerciseTitle,
                            style: TextStyle(
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                              fontSize: 15,
                              color: isSelected
                                  ? Colors.teal.shade800
                                  : Colors.black87,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              _selectedExercise = exerciseTitle;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // CỘT PHẢI (NỘI DUNG/KẾT QUẢ) - Khung màn hình giả lập
          Expanded(
            child: Container(
              // Background gradient nhẹ
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.grey.shade50, Colors.grey.shade200],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              // ĐIỀU CHỈNH: Giảm padding xung quanh để tăng không gian hiển thị
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(
                    // ĐIỀU CHỈNH: Tăng MaxWidth để chiếm nhiều không gian hơn
                    maxWidth: 700,
                    // ĐIỀU CHỈNH: Tăng MaxHeight một chút
                    maxHeight: 900,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 30,
                        spreadRadius: 10,
                        offset: const Offset(0, 15),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: _buildContent(_selectedExercise),
                      ),
                      // Thanh Home Indicator giả lập
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            width: 130,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
