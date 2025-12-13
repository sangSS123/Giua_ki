import 'package:flutter/material.dart';
import '../model/article.dart';
import '../services/news_api.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Lỗi tải dữ liệu tin tức",
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Không có tin tức"));
          }

          final articles = snapshot.data!;

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
