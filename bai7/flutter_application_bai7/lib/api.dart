import 'package:dio/dio.dart';
import 'package:flutter_application_bai6/model/product.dart';

class Api {
  Future<List<Product>> getAllProducts() async {
    var dio = Dio();
    List<Product> lsProduct = []; // Khởi tạo danh sách rỗng

    try {
      var response = await dio.request('https://fakestoreapi.com/products');
      
      if(response.statusCode == 200) {
        List ls = response.data;
        // SỬA LỖI: Bỏ từ khóa 'var' ở đầu dòng dưới để gán vào biến đã khai báo bên trên
        lsProduct = ls.map((json) => Product.fromJson(json)).toList();
      } else {
        print('Lỗi kết nối: ${response.statusCode}');
      }
    } catch (e) {
      print('Có lỗi xảy ra: $e');
    }
    
    return lsProduct; 
  }
}
var test_api = Api();