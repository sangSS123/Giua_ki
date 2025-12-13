import 'package:flutter/material.dart';

// Đổi tên class để phù hợp với quy tắc đặt tên Exercise
class LoginExercise extends StatefulWidget {
  const LoginExercise({super.key});

  @override
  State<LoginExercise> createState() => _LoginExerciseState();
}

class _LoginExerciseState extends State<LoginExercise> {
  // Key toàn cục để quản lý trạng thái của Form
  final _formKey = GlobalKey<FormState>();

  // Controllers để quản lý giá trị của TextFormField
  final _userController = TextEditingController();
  final _passController = TextEditingController();

  // Biến để chuyển đổi hiển thị/ẩn mật khẩu
  bool _obscure = true;

  @override
  void dispose() {
    // Giải phóng controllers khi widget bị hủy
    _userController.dispose();
    _passController.dispose();
    super.dispose();
  }

  void _dangNhap() {
    // Gọi validate để hiển thị lỗi ngay dưới TextField
    if (_formKey.currentState!.validate()) {
      // Logic đăng nhập thành công (giả định)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đăng nhập thành công!'),
          backgroundColor: Colors.green,
        ),
      );
      // Xóa nội dung sau khi đăng nhập (tùy chọn)
      _userController.clear();
      _passController.clear();
    } else {
      // Hiển thị thông báo nếu validation thất bại (tùy chọn)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng kiểm tra lại thông tin.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Đăng nhập'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          // Đảm bảo không bị overflow khi bàn phím hiện lên
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Form(
              key: _formKey,
              // Chỉ hiện lỗi khi nhấn nút (disabled)
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo/Tiêu đề lớn (Thêm vào để giao diện đẹp hơn)
                  const Text(
                    "Đăng Nhập Hệ Thống",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3D5AFE),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // --- Ô nhập tên người dùng ---
                  TextFormField(
                    controller: _userController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_outline),
                      labelText: 'Tên người dùng',
                      hintText: 'Nhập tên người dùng',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập tên người dùng';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // --- Ô nhập mật khẩu ---
                  TextFormField(
                    controller: _passController,
                    obscureText: _obscure,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_outline),
                      labelText: 'Mật khẩu',
                      hintText: 'Nhập mật khẩu',
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscure = !_obscure;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập mật khẩu';
                      } else if (value.length < 6) {
                        return 'Mật khẩu phải ≥ 6 ký tự';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),

                  // --- Nút đăng nhập ---
                  Center(
                    child: SizedBox(
                      width: double.infinity, // Mở rộng hết chiều rộng
                      height: 55,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3D5AFE),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 5,
                        ),
                        onPressed: _dangNhap,
                        icon: const Icon(
                          Icons.login,
                          color: Colors.white,
                          size: 24,
                        ),
                        label: const Text(
                          'Đăng nhập',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
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
    );
  }
}
