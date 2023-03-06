import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double vertical;
  final double horizontal;
  final double radius;
  final Color backgroundColor;
  final Color defaultBackgroundColor;
  final double fontSize;
  final Color textColor;

  ButtonWidget(
      {Key? key,
      required this.label,
      required this.onPressed,
      this.vertical = 16,
      this.horizontal = 70,
      this.radius = 8,
      this.backgroundColor = Colors.transparent,
      this.defaultBackgroundColor = const Color(0xFF8E2DE2),
      this.fontSize = 18,
      this.textColor = const Color(0xffffffff)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor != Colors.transparent
        ? backgroundColor
        : defaultBackgroundColor;
    return ElevatedButton(
      onPressed: this.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        padding: EdgeInsets.symmetric(
            vertical: this.vertical, horizontal: this.horizontal),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(this.radius),
        ),
      ),
      child: Text(
        this.label,
        style: TextStyle(
            fontFamily: AppFontFamily.fontSecondary,
            fontSize: fontSize,
            color: textColor),
      ),
    );
  }
}
