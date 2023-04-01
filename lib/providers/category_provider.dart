import 'package:flutter/foundation.dart' as flutter;
import 'package:mcommerce_app/models/category_model.dart';
import 'package:mcommerce_app/services/category_service.dart';

class CategoryProvider with flutter.ChangeNotifier {
  late List<Childrens> _childrens;
  late List<Data> _categories;
  late List<String> _categoriesNames;

  List<Childrens> get childrens => _childrens;
  List<Data> get categories => _categories;
  List<String> get categoriesNames => _categoriesNames;

  Future<List<Childrens>> fetchCategoriesByParentId(String parentId) async {
    _childrens = await CategoryService.fetchAllCategoryByParentId(parentId);
    notifyListeners();
    return _childrens;
  }

  Future<List<Data>> fetchAllCategories() async {
    List<String> categoryLabels = [];

    _categories = await CategoryService.fetchAllCategory();

    _categories.forEach((category) {
      category.childrens?.forEach((child) {
        categoryLabels.add(child.label!);
      });
    });

    _categoriesNames = categoryLabels;
    notifyListeners();
    return _categories;
  }

  void resetCategories() {
    _childrens.clear();
    notifyListeners();
  }
}
