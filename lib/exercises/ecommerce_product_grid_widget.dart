// lib/exercises/ecommerce_product_grid_widget.dart

import 'package:flutter/material.dart';
import 'package:giua_ki/exercises/api_service.dart';
import '../model/product.dart';

// Đổi tên class để tránh xung đột và làm rõ mục đích widget
class EcommerceProductGridExercise extends StatefulWidget {
  const EcommerceProductGridExercise({super.key});

  @override
  State<EcommerceProductGridExercise> createState() =>
      _EcommerceProductGridExerciseState();
}

class _EcommerceProductGridExerciseState
    extends State<EcommerceProductGridExercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: const [
              SizedBox(width: 10),
              Icon(Icons.search, color: Colors.grey),
              SizedBox(width: 10),
              Text(
                'Tìm sản phẩm...',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: apiService.getAllProduct(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text("Lỗi: ${snap.error.toString()}"));
          }
          if (snap.hasData && snap.data!.isNotEmpty) {
            return _buildProductGrid(snap.data!);
          }
          return const Center(child: Text("Không có sản phẩm nào"));
        },
      ),
    );
  }

  Widget _buildProductGrid(List<Product> ls) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: ls.length,
      itemBuilder: (context, index) {
        return _buildProductCard(ls[index]);
      },
    );
  }

  Widget _buildProductCard(Product p) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Phần hình ảnh
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              child: Image.network(
                p.image,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image_not_supported),
              ),
            ),
          ),

          // 2. Phần thông tin text
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tên sản phẩm (giới hạn 2 dòng)
                Text(
                  p.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 13, color: Colors.black87),
                ),
                const SizedBox(height: 4),

                // Giả lập tag "LazMall"
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: const Text(
                    "LazMall",
                    style: TextStyle(fontSize: 10, color: Colors.red),
                  ),
                ),
                const SizedBox(height: 8),

                // Giá tiền
                Text(
                  "\$${p.price.toStringAsFixed(2)}",
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Đánh giá sao
                Row(
                  children: const [
                    Icon(Icons.star, size: 12, color: Colors.amber),
                    Icon(Icons.star, size: 12, color: Colors.amber),
                    Icon(Icons.star, size: 12, color: Colors.amber),
                    Icon(Icons.star, size: 12, color: Colors.amber),
                    Text(
                      " (99+)",
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
