import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:mcommerce_app/models/user_model.dart';
import 'package:mcommerce_app/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  Data? _user;
  String? _accessToken;
  String? _refreshToken;
  bool _isAuthenticated = false;
  late bool _isSignup;
  late bool _isUpdate;
  int _selectIndexProfile = 0;
  double _sizeHeightAppBar = 110.0;
  late String _message = '';
  Data? get user => _user;
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;
  String get message => _message;
  bool get isAuthenticated => _isAuthenticated;
  bool get isSignup => _isSignup;
  bool get isUpdate => _isUpdate;
  int get selectIndexProfile => _selectIndexProfile;
  double get sizeHeightAppBar => _sizeHeightAppBar;

  Future<void> login(String phone, String password) async {
    final authService = AuthService();
    try {
      _isAuthenticated = false;
      final user = await authService.login(phone, password);
      _message = user.message!;
      if (user.success == true) {
        _user = user.data!;
        _accessToken = user.accessToken!;
        _refreshToken = user.refreshToken!;

        // Save tokens and user data to local storage
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('accessToken', _accessToken!);
        await prefs.setString('refreshToken', _refreshToken!);
        await prefs.setString('userData', json.encode(_user?.toJson()));
        _isAuthenticated = true;
      }
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> signup(String username, String phone, String password) async {
    final authService = AuthService();
    try {
      final user = await authService.signup(username, phone, password);
      _message = user.message!;
      _isSignup = user.success!;
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
    prefs.remove('cart');

    _user = null;
    _accessToken = '';
    _refreshToken = '';
    _message = "Log out successfully!";
    _isSignup = false;
    _isUpdate = false;
    _isAuthenticated = false;
    notifyListeners();
  }

  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('userData');
    if (userData != null) {
      final userJson = json.decode(userData);
      print(_user?.cusAvatar.toString());
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
      String? gender, String? address, File? avatar) async {
    final authService = AuthService();
    try {
      _isUpdate = false;
      final account = await authService.updateInfoAccount(
          id, username, email, gender, address, avatar);
      if (account["success"] == true) {
        final avatarLink = account["avatar"];
        final prefs = await SharedPreferences.getInstance();
        final userData = prefs.getString('userData');
        if (userData != null) {
          Map<String, dynamic> userJson = json.decode(userData);
          userJson['username'] = username;
          userJson['email'] = email;
          userJson['gender'] = gender;
          userJson['address'] = address;
          if (avatarLink != "") {
            userJson['avatar'] = avatarLink;
          }
          prefs.setString('userData', json.encode(userJson));
          _user = Data.fromJson(userJson);
          _isUpdate = true;
          _message = account['message'];
        }
      } else {
        _isUpdate = false;
        _message = account['message'];
      }
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateAddressAccount(String id, String? address) async {
    final authService = AuthService();
    try {
      await authService.updateAddressAccount(id, address);
      final prefs = await SharedPreferences.getInstance();
      final userData = prefs.getString('userData');
      if (userData != null) {
        final userJson = json.decode(userData);
        if (userJson != null) {
          userJson['address'] = address;
          prefs.setString('userData', json.encode(userJson));
        }
        _user = Data.fromJson(userJson);
      }
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }
}
