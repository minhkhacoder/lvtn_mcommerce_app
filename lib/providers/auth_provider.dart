import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:mcommerce_app/models/user_model.dart';
import 'package:mcommerce_app/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  Data? _user;
  String? _accessToken;
  String? _refreshToken;
  bool _isAuthenticated = false;
  bool _isSignup = false;
  int _selectIndexProfile = 0;
  double _sizeHeightAppBar = 110.0;

  Data? get user => _user;
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;
  bool get isAuthenticated => _isAuthenticated;
  bool get isSignup => _isSignup;
  int get selectIndexProfile => _selectIndexProfile;
  double get sizeHeightAppBar => _sizeHeightAppBar;

  Future<void> login(String phone, String password) async {
    final authService = AuthService();
    try {
      final user = await authService.login(phone, password);
      _user = user.data!;
      _accessToken = user.accessToken!;
      _refreshToken = user.refreshToken!;

      // Save tokens and user data to local storage
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('accessToken', _accessToken!);
      await prefs.setString('refreshToken', _refreshToken!);
      await prefs.setString('userData', json.encode(_user?.toJson()));
      _isAuthenticated = true;
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> signup(String username, String phone, String password) async {
    final authService = AuthService();
    try {
      String user = await authService.signup(username, phone, password);
      print(user);
      _isSignup = true;
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> logout() async {
    // Clear tokens and user data from local storage
    final prefs = await SharedPreferences.getInstance();

    prefs.remove('accessToken');
    prefs.remove('refreshToken');
    prefs.remove('userData');

    _user = Data();
    _accessToken = '';
    _refreshToken = '';
    _isAuthenticated = false;
    notifyListeners();
  }

  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('userData');
    if (userData != null) {
      final userJson = json.decode(userData);
      _user = Data.fromJson(userJson);
      _accessToken = prefs.getString('accessToken') ?? '';
      _refreshToken = prefs.getString('refreshToken') ?? '';
      _isAuthenticated = true;
    }

    notifyListeners();
  }

  void changePageIndexProfile(int index, double size) {
    _selectIndexProfile = index;
    _sizeHeightAppBar = size;
    notifyListeners();
  }

  Future<void> updateInfoAccount(String id, String? username, String? email,
      String? gender, String? address) async {
    final authService = AuthService();
    try {
      await authService.updateInfoAccount(id, username, email, gender, address);
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }
}
