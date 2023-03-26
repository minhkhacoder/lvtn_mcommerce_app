import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mcommerce_app/models/delivery_model.dart';
import 'package:http/http.dart' as http;

class DeliveryService {
  static final String _baseUrl = dotenv.env['BASEURL']!;

  static Future<List<Data>> fetchAllShipping() async {
    try {
      final response = await http.get(Uri.parse('${_baseUrl}/shipping/all'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['data'];
        final List<Data> deliveries =
            jsonData.map((data) => Data.fromJson(data)).toList();
        return deliveries;
      } else {
        throw Exception('Failed to fetch deliveries');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
