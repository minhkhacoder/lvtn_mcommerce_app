import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mcommerce_app/models/category_model.dart';

class CategoryService {
  static final String _baseUrl = dotenv.env['BASEURL']!;

  static Future<List<Category>> fetchAllCategoryByParentId(
      String parentId) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/category/parent?parentId=$parentId'),
      );
      // print(response.body);
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['data'];
        // print(jsonData);
        final List<Category> categories =
            jsonData.map((data) => Category.fromJson(data)).toList();
        return categories;
      } else {
        throw Exception('Failed to fetch categories by parent id');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
