import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mcommerce_app/models/rating_model.dart';

class RatingService {
  static final String _baseUrl = dotenv.env['BASEURL']!;

  static Future<List<DataRating>> fetchAllRatingByProductId(
      String proId) async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/rating?proId=$proId'),
      );
      // print(response.body);
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['data'];
        // print(jsonData);
        final List<DataRating> ratings =
            jsonData.map((data) => DataRating.fromJson(data)).toList();
        return ratings;
      } else {
        throw Exception('Failed to fetch all rating by product id');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
