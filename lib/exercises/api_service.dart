import 'package:dio/dio.dart';
import '../model/product.dart'; // Thay đổi import path

class ApiService {
  // Đổi tên class để tránh nhầm lẫn
  Future<List<Product>> getAllProduct() async {
    var dio = Dio();
    // API endpoint: 'https://fakestoreapi.com/products'
    var response = await dio.request('https://fakestoreapi.com/products');
    List<Product> ls = [];

    if (response.statusCode == 200) {
      // Dữ liệu trả về là List
      List data = response.data;
      ls = data.map((x) => Product.fromJson(x)).toList();
    } else {
      // In lỗi
      throw Exception('Lỗi khi tải sản phẩm: ${response.statusCode}');
    }
    return ls;
  }
}

// Khởi tạo instance API service
final apiService = ApiService();
