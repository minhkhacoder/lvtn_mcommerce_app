import 'package:flutter/cupertino.dart';
import 'package:mcommerce_app/models/product_model.dart';
import 'package:mcommerce_app/services/product_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductProvider with ChangeNotifier {
  List<Data> _products = [];
  bool _isLoading = false;

  List<Data> get products => _products;
  bool get isLoading => _isLoading;

  set products(List<Data> products) {
    _products = products;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchProducts() async {
    try {
      _isLoading = true;
      final List<Data> products = await ProductService.fetchAllProduct();
      _products = products;
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      print(error);
    }
  }
}
