import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mcommerce_app/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static final String _baseUrl = dotenv.env['BASEURL']!;

  Future<User> login(String phone, String password) async {
    try {
      final response = await http.post(Uri.parse('${_baseUrl}/customer/login'),
          body: {'phone': phone, 'password': password});

      if (response.statusCode == 200) {
        final jsonBody = json.decode(response.body);
        final user = User.fromJson(jsonBody);
        // print(user.accessToken);
        return user;
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> signup(String username, String phone, String password) async {
    print(username + " " + phone + " " + password);
    try {
      final response = await http.post(Uri.parse('${_baseUrl}/customer/signup'),
          body: {'username': username, 'phone': phone, 'password': password});

      print(response.body);
      if (response.statusCode == 200) {
        return "Account registered successfully!";
      } else {
        throw Exception('Failed to sign up');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
