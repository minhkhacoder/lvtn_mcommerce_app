import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mcommerce_app/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static final String _baseUrl = dotenv.env['BASEURL']!;

  Future<User> login(String phone, String password) async {
    try {
      final response = await http.post(Uri.parse('${_baseUrl}/customer/login'),
          body: {'phone': phone, 'password': password});

      if (response.statusCode == 200) {
        final jsonBody = json.decode(response.body);
        final user = User.fromJson(jsonBody);
        return user;
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> signup(String username, String phone, String password) async {
    try {
      final response = await http.post(
        Uri.parse('${_baseUrl}/customer/signup'),
        body: {'username': username, 'phone': phone, 'password': password},
      );

      // print(response.body);
      if (response.statusCode == 200) {
        return "Account registered successfully!";
      } else {
        throw Exception('Failed to sign up');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> updateInfoAccount(String id, String? username, String? email,
      String? gender, String? address, File? avatar) async {
    final prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken') ?? '';
    final Map<String, String> headers = {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'multipart/form-data',
    };

    try {
      final request = http.MultipartRequest(
        'PUT',
        Uri.parse('${_baseUrl}/customer/update-info'),
      );

      // add fields
      request.fields['id'] = id;
      if (username != null) request.fields['username'] = username;
      if (email != null) request.fields['email'] = email;
      if (gender != null) request.fields['gender'] = gender;
      if (address != null) request.fields['address'] = address;
      request.headers.addAll(headers);
      // add avatar
      if (avatar != null) {
        request.files.add(
          http.MultipartFile(
            'avatar',
            avatar.readAsBytes().asStream(),
            avatar.lengthSync(),
            filename: avatar.path.split('/').last,
          ),
        );
      }

      final response = await request.send();
      final responseString = await response.stream.bytesToString();

      print(responseString);

      if (response.statusCode == 200) {
        return json.decode(responseString)['avatar'];
      } else {
        throw Exception('Failed to update information');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> updateAddressAccount(String id, String? address) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? accessToken = prefs.getString('accessToken') ?? '';
      final Map<String, String> headers = {
        'Authorization': 'Bearer $accessToken',
      };

      final response = await http.put(
          Uri.parse('${_baseUrl}/customer/update-address'),
          body: {'id': id, 'address': address},
          headers: headers);

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to update address');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
