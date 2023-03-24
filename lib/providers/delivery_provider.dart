import 'package:flutter/cupertino.dart';
import 'package:mcommerce_app/models/delivery.dart';
import 'package:mcommerce_app/services/delivery_service.dart';

class DeliveryProvider with ChangeNotifier {
  List<Data> _deliveries = [];
  bool _isLoading = false;

  List<Data> get deliveries => _deliveries;
  bool get isLoading => _isLoading;

  set products(List<Data> deliveries) {
    _deliveries = deliveries;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchDeliveries() async {
    try {
      _isLoading = true;
      final List<Data> deliveries = await DeliveryService.fetchAllShipping();
      _deliveries = deliveries;
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      print(error);
    }
  }
}
