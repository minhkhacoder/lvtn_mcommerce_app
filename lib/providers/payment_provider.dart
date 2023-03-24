import 'package:flutter/cupertino.dart';
import 'package:mcommerce_app/models/payment.dart';
import 'package:mcommerce_app/services/payment_service.dart';

class PaymentProvider with ChangeNotifier {
  List<Data> _payments = [];
  bool _isLoading = false;

  List<Data> get payments => _payments;
  bool get isLoading => _isLoading;

  set products(List<Data> payments) {
    _payments = payments;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchPayments() async {
    try {
      _isLoading = true;
      final List<Data> payments = await PaymentService.fetchAllPayment();
      _payments = payments;
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      print(error);
    }
  }

  Data getPaymentAtIndex(int index) {
    return _payments[index];
  }
}
