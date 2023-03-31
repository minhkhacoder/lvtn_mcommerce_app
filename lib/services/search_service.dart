import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mcommerce_app/models/product_model.dart';

class SearchService {
  static final String _baseUrl = dotenv.env['BASEURL']!;

  static Future<List<Data>> searchAllProductByCategory(String catId) async {
    try {
      final response =
          await http.get(Uri.parse('${_baseUrl}/search/category?catId=$catId'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['data'];
        final List<Data> products =
            jsonData.map((data) => Data.fromJson(data)).toList();
        return products;
      } else {
        throw Exception('Failed to search all product by category');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
