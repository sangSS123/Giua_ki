import 'package:flutter/material.dart';

class Place {
  final String assetPath;
  const Place(this.assetPath);
}

class TravelLayoutExercise extends StatelessWidget {
  const TravelLayoutExercise({super.key});

  final List<Place> savedPlaces = const [
    Place('assets/images/anh1.png'),
    Place('assets/images/anh2.png'),
    Place('assets/images/anh3.png'),
    Place('assets/images/anh4.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(
                        Icons.notifications_none,
                        size: 28.0,
                        color: Colors.black87,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.settings,
                        size: 28.0,
                        color: Colors.black87,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),

                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 34.0,
                      color: Colors.black,
                      height: 1.1,
                    ),
                    children: <TextSpan>[
                      // "Welcome," - In đậm
                      TextSpan(
                        text: 'Welcome,\n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      // "Charlie" - Không in đậm
                      TextSpan(
                        text: 'Charlie',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 34.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30.0),

                // --- 2.3. Thanh Tìm kiếm (Search Bar) ---
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: Colors.blue.shade200,
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.05),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 10.0,
                        ), // Căn chỉnh lại padding
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40.0), // Tăng khoảng cách
                // --- 2.4. Tiêu đề Saved Places ---
                const Text(
                  'Saved Places',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20.0),

                // --- 2.5. GridView (Danh sách ảnh) ---
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 15.0,
                    // Tỷ lệ 1.45 hoặc 1.5 rất gần với hình mẫu
                    childAspectRatio: 1.45,
                  ),
                  itemCount: savedPlaces.length,
                  itemBuilder: (context, index) {
                    final place = savedPlaces[index];
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      // Sử dụng Image.asset như code gốc
                      child: Image.asset(
                        place.assetPath,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        // Thêm errorBuilder để dễ debug nếu ảnh không load được
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.red.shade100,
                            child: const Center(
                              child: Text(
                                'Lỗi tải ảnh. Kiểm tra assets!',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
