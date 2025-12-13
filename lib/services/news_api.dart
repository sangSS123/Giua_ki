import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/article.dart';

class NewsApiService {
  final String apiKey = "4a29d750bb9e4cea8a00f3a42e7d2d2d";

  Future<List<Article>> fetchNews() async {
    final url = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      List articles = data['articles'];

      return articles.map((e) => Article.fromJson(e)).toList();
    } else {
      throw Exception("Không tải được dữ liệu tin tức");
    }
  }
}
