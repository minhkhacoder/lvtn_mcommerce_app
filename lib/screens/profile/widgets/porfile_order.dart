import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';

class ProfileOrder extends StatefulWidget {
  const ProfileOrder({Key? key}) : super(key: key);

  @override
  _ProfileOrderState createState() => _ProfileOrderState();
}

class _ProfileOrderState extends State<ProfileOrder> {
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
