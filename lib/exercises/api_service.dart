import 'package:dio/dio.dart';
import '../model/product.dart';

class ApiService {
  Future<List<Product>> getAllProduct() async {
    var dio = Dio();

    var response = await dio.request('https://fakestoreapi.com/products');
    List<Product> ls = [];

    if (response.statusCode == 200) {
      List data = response.data;
      ls = data.map((x) => Product.fromJson(x)).toList();
    } else {
      throw Exception('Lỗi khi tải sản phẩm: ${response.statusCode}');
    }
    return ls;
  }
}

final apiService = ApiService();
