class Product {
  int id;
  String title;
  dynamic price; // API trả về int hoặc double nên để dynamic hoặc num cho an toàn
  String description;
  String category;
  String image;
  Rating rating; // 1. Bỏ comment dòng này

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating, // 2. Bỏ comment dòng này
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      price: json['price'] ?? 0,
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      image: json['image'] ?? '',
      // 3. Xử lý Rating: Nếu null thì tạo mặc định để không bị lỗi
      rating: json['rating'] != null 
          ? Rating.fromJson(json['rating']) 
          : Rating(rate: 0.0, count: 0),
    );
  }
}

// ... (Giữ nguyên enum Category nếu muốn) ...

class Rating {
  dynamic rate; // Đôi khi API trả về int (4) thay vì double (4.0), dùng dynamic cho an toàn
  int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'] ?? 0,
      count: json['count'] ?? 0,
    );
  }
}