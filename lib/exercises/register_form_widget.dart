// lib/exercises/register_form_widget.dart

import 'package:flutter/material.dart';

class RegisterExercise extends StatefulWidget {
  const RegisterExercise({super.key});

  @override
  State<RegisterExercise> createState() => _RegisterExerciseState();
}

class _RegisterExerciseState extends State<RegisterExercise> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    // Giải phóng controllers
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, textAlign: TextAlign.center),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.deepPurple,
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _showMessage(context, 'Đăng ký thành công!');
      // Xóa form sau khi đăng ký thành công
      _nameController.clear();
      _emailController.clear();
      _passwordController.clear();
      _confirmController.clear();
    } else {
      _showMessage(context, 'Vui lòng điền đầy đủ và chính xác thông tin.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Form Đăng ký tài khoản ',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ), // Đổi màu chữ cho hợp màu AppBar
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Tạo Tài Khoản Mới",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                // Họ tên
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Họ tên',
                    hintText: 'Vui lòng nhập họ tên',
                    prefixIcon: const Icon(Icons.person_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Vui lòng nhập họ tên';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),

                // Email
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Vui lòng nhập email',
                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Vui lòng nhập email';
                    } else if (!value.contains('@')) {
                      return 'Email không hợp lệ';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),

                // Mật khẩu
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Mật khẩu',
                    hintText: 'Vui lòng nhập mật khẩu',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Vui lòng nhập mật khẩu';
                    } else if (value.trim().length < 6) {
                      return 'Mật khẩu phải có ít nhất 6 ký tự';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),

                // Xác nhận mật khẩu
                TextFormField(
                  controller: _confirmController,
                  obscureText: _obscureConfirm,
                  decoration: InputDecoration(
                    labelText: 'Xác nhận mật khẩu',
                    hintText: 'Vui lòng xác nhận mật khẩu',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirm
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureConfirm = !_obscureConfirm;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Vui lòng xác nhận mật khẩu';
                    } else if (value != _passwordController.text) {
                      return 'Mật khẩu xác nhận không khớp';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),

                // Nút đăng ký
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: _submitForm, // Gọi hàm submit
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 5,
                      ),
                      icon: const Icon(
                        Icons.person_add_alt,
                        color: Colors.deepPurple, // Đổi màu icon cho hợp tông
                      ),
                      label: const Text(
                        'Đăng ký Tài khoản',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
