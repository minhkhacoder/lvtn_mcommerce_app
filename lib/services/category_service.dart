import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mcommerce_app/models/category_model.dart';

class CategoryService {
  static final String _baseUrl = dotenv.env['BASEURL']!;

  static Future<List<Childrens>> fetchAllCategoryByParentId(
      String parentId) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/category/parent?parentId=$parentId'),
      );
      // print(response.body);
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['data'];
        // print(jsonData);
        final List<Childrens> categories =
            jsonData.map((data) => Childrens.fromJson(data)).toList();
        return categories;
      } else {
        throw Exception('Failed to fetch categories by parent id');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<Data>> fetchAllCategory() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/category/all'),
      );
      // print(response.body);
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['data'];
        // print(jsonData);
        final List<Data> categories =
            jsonData.map((data) => Data.fromJson(data)).toList();
        return categories;
      } else {
        throw Exception('Failed to fetch categories');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
