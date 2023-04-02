import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/routes/routes.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';
import 'package:mcommerce_app/providers/brand_provider.dart';
import 'package:mcommerce_app/providers/category_provider.dart';
import 'package:mcommerce_app/screens/search/filter_page.dart';
import 'package:mcommerce_app/widgets/statefull/input_search.dart';
import 'package:provider/provider.dart';

class AppBarSearchWidget extends StatelessWidget {
  final String title;
  final String? catId;
  const AppBarSearchWidget({Key? key, required this.title, this.catId})
      : super(key: key);

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
            title,
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
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FilterPage(
                            selectedCategories: [catId.toString()],
                          )));
              final brandProvider =
                  Provider.of<BrandProvider>(context, listen: false);
              brandProvider.fetchAllBrands();
              Provider.of<CategoryProvider>(context, listen: false)
                  .fetchAllCategories();
            },
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
