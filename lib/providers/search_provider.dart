import 'package:flutter/cupertino.dart';
import 'package:mcommerce_app/models/product_model.dart';
import 'package:mcommerce_app/services/search_service.dart';

class SearchProvider with ChangeNotifier {
  List<Data> _products = [];
  bool _isLoading = false;

  List<Data> get products => _products;
  bool get isLoading => _isLoading;

  set products(List<Data> products) {
    _products = products;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> searchAllProductByCategory(String catId) async {
    try {
      _isLoading = true;
      final List<Data> products =
          await SearchService.searchAllProductByCategory(catId);
      _products = products;
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      print(error);
    }
  }
}
