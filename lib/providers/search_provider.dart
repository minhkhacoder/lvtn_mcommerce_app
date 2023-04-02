import 'package:flutter/cupertino.dart';
import 'package:mcommerce_app/models/product_model.dart';
import 'package:mcommerce_app/services/search_service.dart';

class SearchProvider with ChangeNotifier {
  List<Data> _products = [];
  List<String> _brands = [];
  bool _isLoading = false;

  List<Data> get products => _products;
  List<String> get brands => _brands;
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

      List<String> brandNames = [];
      for (Data product in _products) {
        String brandName = product.toJson()['brand']["id"];
        if (!brandNames.contains(brandName)) {
          brandNames.add(brandName);
        }
      }
      _brands = brandNames;
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      print(error);
    }
  }
}
