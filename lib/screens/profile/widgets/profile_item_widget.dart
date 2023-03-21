// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';

class ProfileItemWidget extends StatefulWidget {
  final Icon icon;
  final String title;
  final Function()? onTap;
  const ProfileItemWidget({
    Key? key,
    required this.icon,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  _ProfileItemWidgetState createState() => _ProfileItemWidgetState();
}

class _ProfileItemWidgetState extends State<ProfileItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Row(
          children: [
            widget.icon,
            SizedBox(
              width: 12,
            ),
            Text(
              widget.title,
              style: TextStyle(
                  color: AppColors.dark,
                  fontFamily: AppFontFamily.fontSecondary,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.41),
            )
          ],
        ),
      ),
    );
  }
}
