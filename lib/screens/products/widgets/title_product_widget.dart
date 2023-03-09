import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';

class TitleProductWidget extends StatelessWidget {
  final String title;
  const TitleProductWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: AppColors.dark,
          fontFamily: AppFontFamily.fontSecondary,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: -0.15),
    );
  }
}
