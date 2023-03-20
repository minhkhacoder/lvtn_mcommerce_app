import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mcommerce_app/models/product_model.dart';

class ProductService {
  static final String _baseUrl = dotenv.env['BASEURL']!;

  static Future<List<Data>> fetchAllProduct() async {
    try {
      final response = await http.get(Uri.parse('${_baseUrl}/product/all'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['data'];
        final List<Data> products =
            jsonData.map((data) => Data.fromJson(data)).toList();
        return products;
      } else {
        throw Exception('Failed to fetch products');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
