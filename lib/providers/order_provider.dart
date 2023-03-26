import 'package:flutter/foundation.dart';
import 'package:mcommerce_app/models/order_model.dart';
import 'package:mcommerce_app/services/order_service.dart';

class OrderProvider extends ChangeNotifier {
  List<OrderDetail> _orderDetails = [];
  List<OrderDetail> get orderDetails => _orderDetails;
  void addOrderDetail(OrderDetail orderDetail) {
    _orderDetails.add(orderDetail);
    notifyListeners();
  }

  void removeOrderDetail(int index) {
    _orderDetails.removeAt(index);
    notifyListeners();
  }

  void resetOrderDetails() {
    _orderDetails = [];
    notifyListeners();
  }

  Future<bool> createOrder(
      String accId, String shipId, String payId, String orAddress) async {
    if (_orderDetails.isEmpty) {
      throw Exception('Order details cannot be empty');
    }

    final order = Order(
      accId: accId,
      shipId: shipId,
      payId: payId,
      orAddress: orAddress,
      orderDetail: _orderDetails,
    );

    try {
      final result = await OrderService().createOrder(order);
      resetOrderDetails();
      return result;
    } catch (e) {
      throw Exception('Failed to create order: $e');
    }
  }
}
