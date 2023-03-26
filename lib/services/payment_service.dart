import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mcommerce_app/models/payment_model.dart';

class PaymentService {
  static final String _baseUrl = dotenv.env['BASEURL']!;

  static Future<List<Data>> fetchAllPayment() async {
    try {
      final response = await http.get(Uri.parse('${_baseUrl}/payment/all'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['data'];
        final List<Data> payments =
            jsonData.map((data) => Data.fromJson(data)).toList();
        return payments;
      } else {
        throw Exception('Failed to fetch payments');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
