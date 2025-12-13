import 'package:flutter/material.dart';

class Place {
  final String imagePath;
  final String name;
  final String rating;
  final String review;
  final String distance;
  final String roomType;
  final String price;
  final String note1;
  final String note2;
  final String tag;

  const Place({
    required this.imagePath,
    required this.name,
    required this.rating,
    required this.review,
    required this.distance,
    required this.roomType,
    required this.price,
    required this.note1,
    required this.note2,
    required this.tag,
  });
}

final List<Place> savedPlaces = const [
  Place(
    imagePath: 'assets/images/anh5.png',
    name: 'aNhill Boutique',
    rating: '9.5',
    review: 'Xuất sắc · 95 đánh giá',
    distance: 'Huế · Cách bạn 0,6km',
    roomType: '1 suite riêng tư: 1 giường',
    price: 'US\$109',
    note1: 'Đã bao gồm thuế và phí',
    note2: '',
    tag: 'Bao bữa sáng',
  ),
  Place(
    imagePath: 'assets/images/anh6.png',
    name: 'An Nam Hue Boutique',
    rating: '9.2',
    review: 'Tuyệt hảo · 34 đánh giá',
    distance: 'Cư Chính · Cách bạn 0,9km',
    roomType: '1 phòng khách sạn: 1 giường',
    price: 'US\$20',
    note1: 'Đã bao gồm thuế và phí',
    note2: '',
    tag: 'Bao bữa sáng',
  ),
  Place(
    imagePath: 'assets/images/anh7.png',
    name: 'Huế Jade Hill Villa',
    rating: '8.0',
    review: 'Rất tốt · 1 đánh giá',
    distance: 'Cư Chính · Cách bạn 1,3km',
    roomType:
        '1 biệt thự nguyên căn – 1.000 m²:\n4 giường · 3 phòng ngủ · 1 phòng khách · 3 phòng tắm',
    price: 'US\$285',
    note1: 'Đã bao gồm thuế và phí',
    note2:
        'Chỉ còn 1 căn với giá này trên Booking.com\nKhông cần thanh toán trước',
    tag: '',
  ),
  Place(
    imagePath: 'assets/images/anh8.png',
    name: 'Êm Villa',
    rating: '9.0',
    review: 'Tuyệt hảo · 12 đánh giá',
    distance: 'Huế · Cách bạn 1,1km',
    roomType: '1 villa riêng tư: 1 giường đôi lớn',
    price: 'US\$60',
    note1: 'Đã bao gồm thuế và phí',
    note2: '',
    tag: 'Bao bữa sáng',
  ),
];

class ProductListExercise extends StatelessWidget {
  const ProductListExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: const Color(0xFF005BBB),
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 10,
              bottom: 16,
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.orange, width: 2),
              ),
              child: Row(
                children: const [
                  Icon(Icons.arrow_back, color: Colors.black),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Xung quanh vị trí hiện tại   23 thg 10 – 24 thg 10',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildButtonColumn(Icons.sort, 'Sắp xếp', hasRedDot: true),
                _buildButtonColumn(Icons.tune, 'Lọc'),
                _buildButtonColumn(Icons.map_outlined, 'Bản đồ'),
              ],
            ),
          ),

          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            alignment: Alignment.centerLeft,
            child: const Text(
              '757 chỗ nghỉ',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: savedPlaces.length,
              itemBuilder: (context, index) {
                final place = savedPlaces[index];
                return _PlaceCard(place: place);
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildButtonColumn(
  IconData icon,
  String label, {
  bool hasRedDot = false,
}) {
  return Column(
    children: [
      Stack(
        clipBehavior: Clip.none,
        children: [
          Icon(icon, color: Colors.black87, size: 24),
          if (hasRedDot)
            Positioned(
              top: 0,
              right: -2,
              child: Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
      const SizedBox(height: 4),
      Text(label, style: const TextStyle(fontSize: 13, color: Colors.black87)),
    ],
  );
}

class _PlaceCard extends StatelessWidget {
  final Place place;
  const _PlaceCard({required this.place});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 220,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(place.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Image.asset(
                  place.imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 220,
                      width: 140,
                      child: const Center(
                        child: Text('Lỗi ảnh!', textAlign: TextAlign.center),
                      ),
                    );
                  },
                ),
              ),
              if (place.tag.isNotEmpty)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 24,
                    decoration: const BoxDecoration(
                      color: Color(0xFF008234),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      place.tag,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              place.name,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (place.name == 'aNhill Boutique')
                              Row(
                                children: List.generate(
                                  5,
                                  (index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 14,
                                  ),
                                ),
                              ),
                            if (place.name == 'Huế Jade Hill Villa')
                              const Padding(
                                padding: EdgeInsets.only(top: 2),
                                child: Text(
                                  'Được quản lý bởi một host cá nhân',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.favorite_border,
                        color: Colors.black54,
                        size: 20,
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue[700],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          place.rating,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          place.review,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey,
                        size: 14,
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Text(
                          place.distance,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(height: 6),
                        Text(
                          place.roomType,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          place.price,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        if (place.note1.isNotEmpty)
                          Text(
                            place.note1,
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        if (place.note2.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                if (place.note2.contains('Chỉ còn'))
                                  const Text(
                                    'Chỉ còn 1 căn với giá này trên Booking.com',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFFC30000),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                const SizedBox(height: 2),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Icon(
                                      Icons.check_circle,
                                      color: Color(0xFF008234),
                                      size: 14,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      'Không cần thanh toán trước',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF008234),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
