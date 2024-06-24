import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uas/models/produk_model.dart';

class ApiService {
  final String apiUrl =
      'https://b0ec-2001-448a-6040-25a4-50cc-149e-220e-4fd9.ngrok-free.app/products';
  
  Future<List<Products>> getProduk() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<Products> produk =
            body.map((dynamic item) => Products.fromJson(item)).toList();
        return produk;
      } else {
        throw Exception('Failed to load produk: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load produk: $e');
    }
  }



  void _handleStatusCode(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }

  void _handleError(dynamic e) {
    print('Error: $e');
  }
}
