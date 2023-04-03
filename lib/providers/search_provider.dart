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

  Future<void> filterProducts(double? max_price, String? cat_id,
      List<String>? bra_ids, double? rating) async {
    try {
      String query = '';
      String _qprice = '';
      String _qcate = '';
      String _qbrand = '';
      String _qrating = '';

      if (max_price! > 0.0) {
        _qprice = 'max_price=${max_price}';
      }

      if (cat_id?.isNotEmpty ?? false) {
        _qcate = '&cat_id=${cat_id}';
      }

      if (bra_ids!.isNotEmpty) {
        for (var element in bra_ids) {
          _qbrand = _qbrand + '&bra_ids=${element}';
        }
      }

      if (rating! > 0.0) {
        _qrating = '&rating=${rating}';
      }
      query = _qprice + _qcate + _qbrand + _qrating;
      print(query);
      _isLoading = true;
      final List<Data> products = await SearchService.filterProducts(query);
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

  Future<void> searchProductByKey(String key) async {
    try {
      _isLoading = true;
      final List<Data> products =
          await SearchService.searchProductByKey("key=${key}");
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
