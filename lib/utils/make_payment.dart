import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stripe/flutter_stripe.dart';

class PaymentStripe {
  Map<String, dynamic>? paymentIntentData;

  Future<void> makePayment(
      String account, void Function() displayPaymentSheet) async {
    try {
      paymentIntentData = await createPaymentIntent(account);
      if (paymentIntentData != null) {
        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              // applePay: true,
              googlePay: PaymentSheetGooglePay(merchantCountryCode: "US"),
              merchantDisplayName: "Kha",
              style: ThemeMode.dark,
              customerId: paymentIntentData!['customer'],
              paymentIntentClientSecret: paymentIntentData!['client_secret'],
              customerEphemeralKeySecret: paymentIntentData!['ephemeralkey']),
        );
        displayPaymentSheet();
      }
    } on StripeException catch (e) {
      print("Error from stripe $e");
    } catch (e) {
      print("Exception ==== $e");
    }
  }

  createPaymentIntent(String account) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(account),
        'currency': "USD",
        'payment_method_types[]': 'card',
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51MpPX0IfWfEKKXTWHy4kwHAsis7q1kMt4lT9kZ9t82YocANs7G2loJx4V1eYOc0sxQp8WDcgiHZ891LtofAs64Um00kx63xXwe',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print('Create Intent reponse ===> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (e) {
      print("error charging user $e");
    }
  }

  calculateAmount(String amount) {
    print(amount);
    final a = double.parse(amount) * 100;
    return a.round().toString();
  }
}
