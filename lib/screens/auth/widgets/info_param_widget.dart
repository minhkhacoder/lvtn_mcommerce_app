import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';

class InfoParamWidget extends StatelessWidget {
  final String number;
  final String text;
  const InfoParamWidget({Key? key, required this.number, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          number,
          style: TextStyle(color: AppColors.red, fontSize: 16.0),
        ),
        SizedBox(
          width: 6.0,
        ),
        Text(
          text,
          style: TextStyle(color: AppColors.darkGray, fontSize: 16.0),
        )
      ],
    );
  }
}
