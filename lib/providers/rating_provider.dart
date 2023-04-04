import 'package:flutter/foundation.dart';
import 'package:mcommerce_app/models/rating_model.dart';
import 'package:mcommerce_app/services/rating_service.dart';

class RatingProvider with ChangeNotifier {
  late List<DataRating> _ratings;

  List<DataRating> get ratings => _ratings;

  Future<List<DataRating>> fetchAllRatingByProductId(String proId) async {
    _ratings = await RatingService.fetchAllRatingByProductId(proId);
    notifyListeners();
    return _ratings;
  }

  void resetRatings() {
    _ratings.clear();
    notifyListeners();
  }
}
