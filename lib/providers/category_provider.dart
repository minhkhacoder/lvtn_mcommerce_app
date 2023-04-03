import 'package:flutter/foundation.dart' as flutter;
import 'package:mcommerce_app/models/category_model.dart';
import 'package:mcommerce_app/services/category_service.dart';

class CategoryProvider with flutter.ChangeNotifier {
  late List<Childrens> _childrens;
  late List<Data> _categories;
  late List<String> _listLabel;

  List<Childrens> get childrens => _childrens;
  List<Data> get categories => _categories;
  List<String> get listLabel => _listLabel;

  Future<List<Childrens>> fetchCategoriesByParentId(String parentId) async {
    _childrens = await CategoryService.fetchAllCategoryByParentId(parentId);
    notifyListeners();
    return _childrens;
  }

  Future<List<Data>> fetchAllCategories() async {
    List<Childrens> categoryLabels = [];

    _categories = await CategoryService.fetchAllCategory();

    _categories.forEach((category) {
      _listLabel.add(category.label.toString());
      category.childrens?.forEach((child) {
        categoryLabels.add(child);
      });
    });

    _childrens = categoryLabels;
    notifyListeners();
    return _categories;
  }

  void resetCategories() {
    _childrens.clear();
    notifyListeners();
  }
}
