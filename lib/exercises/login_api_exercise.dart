import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userController = TextEditingController(
    text: 'emilys',
  );
  final TextEditingController _passController = TextEditingController(
    text: 'emilyspass',
  );

  bool _isLoading = false;
  String _errorMessage = '';
  Map<String, dynamic>? _userData;

  // ───────────────────────────────
  // 🔥 LOGIN
  // ───────────────────────────────
  Future<String?> _loginApi(String username, String password) async {
    try {
      final resp = await http.post(
        Uri.parse("https://dummyjson.com/auth/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": username,
          "password": password,
          "expiresInMins": 30,
        }),
      );

      print("LOGIN: ${resp.statusCode}");
      print("BODY: ${resp.body}");

      if (resp.statusCode == 200) {
        final json = jsonDecode(resp.body);
        return json["accessToken"];
      }
    } catch (e) {
      print("Lỗi login: $e");
    }
    return null;
  }

  // ───────────────────────────────
  // 🔥 LẤY PROFILE
  // ───────────────────────────────
  Future<void> _getUserProfileApi(String token) async {
    try {
      final resp = await http.get(
        Uri.parse("https://dummyjson.com/auth/me"),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      );

      print("PROFILE: ${resp.statusCode}");
      print("BODY: ${resp.body}");

      if (resp.statusCode == 200) {
        setState(() {
          _userData = jsonDecode(resp.body);
          _isLoading = false;
        });
        return;
      }
    } catch (e) {
      print("Lỗi profile: $e");
    }

    setState(() {
      _isLoading = false;
      _errorMessage = "Không thể lấy thông tin người dùng!";
    });
  }

  // ───────────────────────────────
  // 🔥 XỬ LÝ LOGIN
  // ───────────────────────────────
  Future<void> _handleLogin() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    final token = await _loginApi(
      _userController.text.trim(),
      _passController.text.trim(),
    );

    if (token != null) {
      await _getUserProfileApi(token);
    } else {
      setState(() {
        _isLoading = false;
        _errorMessage = "Sai tên đăng nhập hoặc mật khẩu!";
      });
    }
  }

  // 🔥 ĐĂNG XUẤT
  void _handleLogout() {
    setState(() {
      _userData = null;
      _isLoading = false;
      _errorMessage = '';
    });
  }

  // ───────────────────────────────
  // UI
  // ───────────────────────────────
  @override
  Widget build(BuildContext context) {
    final isLoggedIn = _userData != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isLoggedIn ? "Hồ sơ" : "Đăng nhập"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        actions: [
          if (isLoggedIn)
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: _handleLogout,
            ),
        ],
      ),
      body: isLoggedIn ? _buildProfileView() : _buildLoginForm(),
    );
  }

  // ───────────────────────────────
  // WIDGET LOGIN
  // ───────────────────────────────
  Widget _buildLoginForm() {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Icon(Icons.lock, color: Colors.blue, size: 80),
                  const SizedBox(height: 20),
                  const Text(
                    "Chào mừng trở lại!",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 25),
                  TextField(
                    controller: _userController,
                    decoration: const InputDecoration(
                      labelText: "Tài khoản",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: _passController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Mật khẩu",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _handleLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              "ĐĂNG NHẬP",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                  if (_errorMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        _errorMessage,
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
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

  // ───────────────────────────────
  // WIDGET PROFILE
  // ───────────────────────────────
  Widget _buildProfileView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(_userData!["image"]),
          ),
          const SizedBox(height: 15),
          Text(
            "${_userData!['firstName']} ${_userData!['lastName']}",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            "@${_userData!['username']}",
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: _handleLogout,
            icon: const Icon(Icons.logout, color: Colors.red),
            label: const Text("Đăng xuất", style: TextStyle(color: Colors.red)),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.red),
            ),
          ),
          const SizedBox(height: 30),
          _info("Email", _userData!["email"]),
          _info("SĐT", _userData!["phone"]),
          _info("Ngày sinh", _userData!["birthDate"]),
          _info("Giới tính", _userData!["gender"]),
        ],
      ),
    );
  }

  Widget _info(String label, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          ),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
