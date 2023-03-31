import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';

class AppBarFilterWidget extends StatefulWidget {
  const AppBarFilterWidget({Key? key}) : super(key: key);

  @override
  _AppBarFilterWidgetState createState() => _AppBarFilterWidgetState();
}

class _AppBarFilterWidgetState extends State<AppBarFilterWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.white,
            size: 24,
          )),
      title: Row(
        children: [
          Text(
            "Filter",
            style: TextStyle(
                color: AppColors.white,
                fontFamily: AppFontFamily.fontThird,
                fontWeight: FontWeight.w700,
                fontSize: 18,
                letterSpacing: 1),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.primary,
                AppColors.third,
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(14.0))),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.filter_alt,
              color: Colors.transparent,
              size: 24,
            )),
      ],
    );
  }
}
