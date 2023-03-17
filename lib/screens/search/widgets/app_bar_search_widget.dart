import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/routes/routes.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';
import 'package:mcommerce_app/widgets/statefull/input_search.dart';

class AppBarSearchWidget extends StatelessWidget {
  const AppBarSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.layoutPage);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.white,
            size: 24,
          )),
      title: Row(
        children: [
          Text(
            "Bikes",
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
              color: Colors.white,
              size: 24,
            )),
      ],
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(44.0),
          child: Container(
            padding: EdgeInsets.only(bottom: 10),
            child: InputSearch(
              hintsText: "What are you looking for?",
            ),
          )),
    );
  }
}
