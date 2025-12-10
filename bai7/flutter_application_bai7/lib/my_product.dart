import 'package:flutter/material.dart';
import 'package:flutter_application_bai6/api.dart';
import 'package:flutter_application_bai6/model/product.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  late Future<List<Product>> _listFuture;

  @override
  void initState() {
    super.initState();
    _listFuture = test_api.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --- BẮT ĐẦU CHỈNH SỬA APPBAR ---
      appBar: AppBar(
        // Sử dụng mã màu cam đặc trưng của Shopee
        backgroundColor: const Color(0xFFEE4D2D),
        // Giảm khoảng cách lề mặc định để các phần tử sát lề trái hơn
        titleSpacing: 10.0,
        // Sử dụng Row để sắp xếp các thành phần theo chiều ngang
        title: Row(
          children: [
            // 1. Tên "TamShop" nằm bên trái
            const Text(
              "TamShop",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white, // Chữ màu trắng
              ),
            ),
            const SizedBox(width: 15), // Tạo khoảng cách

            // 2. Thanh tìm kiếm (Mô phỏng bằng Container trắng)
            Expanded(
              child: Container(
                height: 38, // Chiều cao thanh tìm kiếm
                decoration: BoxDecoration(
                  color: Colors.white, // Nền màu trắng
                  borderRadius: BorderRadius.circular(2), // Bo góc nhẹ
                ),
                child: Row(
                  children: [
                    // Phần text placeholder (gợi ý tìm kiếm)
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          // Văn bản giống trong hình bạn gửi
                          "TamShop bao ship 0Đ - Đăng ký ngay!", 
                          style: TextStyle(color: Colors.grey),
                          overflow: TextOverflow.ellipsis, // Cắt bớt nếu quá dài
                        ),
                      ),
                    ),
                    // Nút icon tìm kiếm màu cam ở góc phải
                    Container(
                      width: 50,
                      height: 38,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFB5533), // Màu cam nút tìm kiếm
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: const Icon(Icons.search, color: Colors.white, size: 20),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 15),

            // 3. Icon Giỏ hàng nằm bên phải cùng
            IconButton(
              // Sử dụng icon giỏ hàng dạng viền cho giống
              icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 28),
              onPressed: () {
                print("Bấm vào giỏ hàng");
                // Sau này có thể thêm hành động mở trang giỏ hàng tại đây
              },
            ),
          ],
        ),
      ),
      // --- KẾT THÚC CHỈNH SỬA APPBAR ---

      backgroundColor: Colors.grey[200], 
      body: FutureBuilder<List<Product>>(
        future: _listFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Lỗi: ${snapshot.error}"));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return myGridList(snapshot.data!);
          } else {
            return const Center(child: Text("Không có dữ liệu"));
          }
        },
      ),
    );
  }

  // Phần hiển thị danh sách sản phẩm (giữ nguyên như trước)
  Widget myGridList(List<Product> lsProduct) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: lsProduct.length,
      itemBuilder: (context, index) {
        return myItem(lsProduct[index]);
      },
    );
  }

  Widget myItem(Product p) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: Image.network(
                p.image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  p.title,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${p.price}',
                  style: const TextStyle(
                    fontSize: 16, 
                    color: Colors.red, 
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '${p.rating.rate}',
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '(${p.rating.count})',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}