import 'package:flutter/material.dart';

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

class MyPlace extends StatefulWidget {
  const MyPlace({super.key});

  @override
  State<MyPlace> createState() => _MyPlaceState();
}

class _MyPlaceState extends State<MyPlace> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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

  // Khởi tạo là chuỗi rỗng để hiện màn hình chào mừng lúc đầu
  String _selectedExercise = '';

  Widget _buildContent(String title) {
    switch (title) {
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
                  size: 80,
                  color: Colors.teal.shade700,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Chào mừng bạn đến với bài giữa kì',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Mở Menu bên trái và chọn một bài tập để bắt đầu.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isExerciseSelected = _selectedExercise.isNotEmpty;

    return Scaffold(
      key: _scaffoldKey, // Gán key để điều khiển drawer
      appBar: AppBar(
        title: Text(
          isExerciseSelected
              ? _selectedExercise.toUpperCase()
              : 'BÀI TẬP GIỮA KÌ',
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal.shade700,
        foregroundColor: Colors.white,
        elevation: 4,
        // Nút điều hướng bên trái AppBar
        leading: isExerciseSelected
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    _selectedExercise = ''; // Quay về màn hình chào mừng
                  });
                  _scaffoldKey.currentState?.openDrawer(); // Tự động mở menu
                },
              )
            : null, // Nếu chưa chọn gì, Flutter tự hiện icon Hamburger mở drawer
      ),

      // Thanh Hamburger Menu
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.teal.shade700),
              accountName: const Text(
                "Menu Bài ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              accountEmail: const Text("Toàn bộ bài thực hành "),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.code, color: Colors.teal, size: 40),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  final item = exercises[index];
                  final title = item['title'] as String;
                  final isSelected = _selectedExercise == title;

                  return ListTile(
                    selected: isSelected,
                    selectedTileColor: Colors.teal.shade50,
                    leading: Icon(
                      item['icon'] as IconData,
                      color: isSelected ? Colors.teal.shade700 : Colors.grey,
                    ),
                    title: Text(
                      title,
                      style: TextStyle(
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: isSelected
                            ? Colors.teal.shade800
                            : Colors.black87,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _selectedExercise = title;
                      });
                      Navigator.pop(context); // Đóng drawer sau khi chọn bài
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // Vùng hiển thị nội dung bài tập
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey.shade50, Colors.grey.shade200],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 800),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: _buildContent(_selectedExercise),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
