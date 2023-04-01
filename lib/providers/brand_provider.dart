import 'package:flutter/foundation.dart' as flutter;
import 'package:mcommerce_app/models/brand_model.dart';
import 'package:mcommerce_app/services/brand_service.dart';

class BrandProvider with flutter.ChangeNotifier {
  List<Data> _brands = [];
  List<String> _brandNames = [];

  List<Data> get brands => _brands;
  List<String> get brandNames => _brandNames;

  Future<List<Data>> fetchAllBrands() async {
    _brands = await BrandService.fetchAllBrands();
    _brandNames = _brands.map((brand) => brand.label.toString()).toList();
    notifyListeners();
    return _brands;
  }
}
