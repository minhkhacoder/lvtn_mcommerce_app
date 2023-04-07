import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';

class ProfilePayment extends StatefulWidget {
  const ProfilePayment({Key? key}) : super(key: key);

  @override
  _ProfilePaymentState createState() => _ProfilePaymentState();
}

class _ProfilePaymentState extends State<ProfilePayment> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            padding: EdgeInsets.only(top: 24, left: 24, right: 24),
            color: AppColors.white,
            // decoration: BoxDecoration(color: AppColors.white),
            child: Center(
              child: Text("Payment methods"),
            ))
      ],
    );
  }
}
