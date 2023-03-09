import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';

class HeadingWidget extends StatelessWidget {
  final String title;
  final Widget? child;
  const HeadingWidget({Key? key, required this.title, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24, bottom: 16),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: AppFontFamily.fontSecondary,
                  fontWeight: FontWeight.w700,
                  color: AppColors.dark,
                  letterSpacing: -0.49),
            ),
            GestureDetector(onTap: () {}, child: child ?? SizedBox.shrink())
          ]),
    );
  }
}
