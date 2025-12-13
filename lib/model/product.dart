class Product {
  final int id;
  final String title;
  final double price;
  final String image;
  final String category;
  final String description;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.category,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      category: json['category'] ?? '',
      // Đảm bảo ép kiểu giá trị 'price' từ 'num' (int hoặc double) sang double
      price: (json['price'] as num).toDouble(),
    );
  }
}
