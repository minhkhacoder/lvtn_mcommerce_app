import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';

class TitleProductWidget extends StatelessWidget {
  final String title;
  final FontWeight fontWeight;
  final double fontSize;
  const TitleProductWidget(
      {Key? key,
      required this.title,
      this.fontWeight = FontWeight.w400,
      this.fontSize = 14.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: AppColors.dark,
          fontFamily: AppFontFamily.fontSecondary,
          fontWeight: fontWeight,
          fontSize: fontSize,
          letterSpacing: -0.15),
    );
  }
}
