import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/article.dart';

class DetailScreen extends StatelessWidget {
  final Article article;

  const DetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse(article.url);

    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            if (article.urlToImage.isNotEmpty)
              Image.network(
                article.urlToImage,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    color: Colors.grey[300],
                    alignment: Alignment.center,
                    child: Icon(Icons.broken_image, size: 50),
                  );
                },
              ),

            SizedBox(height: 16),

            Text(
              article.description,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(article.content, style: TextStyle(fontSize: 16)),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                if (!await launchUrl(
                  url,
                  mode: LaunchMode.externalApplication,
                )) {
                  throw Exception("Không mở được link");
                }
              },
              child: Text("Mở bài viết gốc"),
            ),
          ],
        ),
      ),
    );
  }
}
