import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mcommerce_app/models/order_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OrderService {
  static final String _baseUrl = dotenv.env['BASEURL']!;
  Future<bool> createOrder(Order order) async {
    final prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken') ?? '';
    final String json = jsonEncode(order.toJson());

    final Map<String, String> headers = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
    try {
      final response = await http.post(
        Uri.parse('${_baseUrl}/order/create'),
        body: json,
        headers: headers,
      );
      // print(response.body);
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to create order');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
