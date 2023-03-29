import 'package:flutter/foundation.dart' as flutter;
import 'package:mcommerce_app/models/category_model.dart';
import 'package:mcommerce_app/services/category_service.dart';

class CategoryProvider with flutter.ChangeNotifier {
  late List<Category> _categories;

  List<Category> get categories => _categories;

  Future<List<Category>> fetchCategoriesByParentId(String parentId) async {
    _categories = await CategoryService.fetchAllCategoryByParentId(parentId);
    notifyListeners();
    return _categories;
  }

  void resetCategories() {
    _categories.clear();
    notifyListeners();
  }
}
