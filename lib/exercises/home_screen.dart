import 'package:flutter/material.dart';
import '../model/article.dart'; // Sửa import
import '../services/news_api.dart'; // Sửa import
import 'detail_screen.dart'; // Giữ nguyên, vì cùng cấp

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NewsApiService api = NewsApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tin tức hôm nay")),
      body: FutureBuilder<List<Article>>(
        future: api.fetchNews(),
        builder: (context, snapshot) {
          // Xử lý lỗi
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Lỗi tải dữ liệu tin tức",
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          // Xử lý trạng thái đang tải
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // Xử lý trường hợp không có dữ liệu
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Không có tin tức"));
          }

          final articles = snapshot.data!;

          // Hiển thị danh sách
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final a = articles[index];

              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  leading: a.urlToImage.isNotEmpty
                      ? Image.network(
                          a.urlToImage,
                          width: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Icon(Icons.image),
                        )
                      : null,
                  title: Text(a.title),
                  subtitle: Text(a.description),
                  onTap: () {
                    // Chuyển sang màn hình chi tiết
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailScreen(article: a),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
