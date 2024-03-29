import 'package:flutter/foundation.dart';
import 'package:mcommerce_app/models/order_detail_model.dart';
import 'package:mcommerce_app/services/order_service.dart';

class OrderDetailProvider extends ChangeNotifier {
  List<DataOrderDetail> _orders = [];
  bool _isLoading = false;
  bool _isOrder = false;
  List<DataOrderDetail> get orders => _orders;
  bool get isLoading => _isLoading;
  bool get isOrder => _isOrder;

  Future<void> getAllOrders(String accId) async {
    final orderService = OrderService();
    try {
      _isLoading = true;
      final List<DataOrderDetail> results =
          await orderService.getAllOrders(accId);
      // print(results[0]);
      _orders = results;
      _isLoading = false;
      _isOrder = true;
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      print(error);
    }
  }
}
