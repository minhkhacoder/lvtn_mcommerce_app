import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mcommerce_app/models/brand_model.dart';

class BrandService {
  static final String _baseUrl = dotenv.env['BASEURL']!;

  static Future<List<DataBrand>> fetchAllBrands() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/brand/all'),
      );
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['data'];
        final List<DataBrand> brands =
            jsonData.map((data) => DataBrand.fromJson(data)).toList();

        return brands;
      } else {
        throw Exception('Failed to fetch brands');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
