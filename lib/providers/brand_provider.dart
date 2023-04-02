import 'package:flutter/foundation.dart' as flutter;
import 'package:mcommerce_app/models/brand_model.dart';
import 'package:mcommerce_app/services/brand_service.dart';

class BrandProvider with flutter.ChangeNotifier {
  List<DataBrand> _brands = [];
  List<String> _brandNames = [];

  List<DataBrand> get brands => _brands;
  List<String> get brandNames => _brandNames;

  Future<List<DataBrand>> fetchAllBrands() async {
    _brands = await BrandService.fetchAllBrands();
    _brandNames = _brands.map((brand) => brand.label.toString()).toList();
    notifyListeners();
    return _brands;
  }
}
