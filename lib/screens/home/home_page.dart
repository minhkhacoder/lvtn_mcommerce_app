import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';
import 'package:mcommerce_app/providers/cart_provider.dart';
import 'package:mcommerce_app/screens/home/widgets/slide_category_widget.dart';
import 'package:mcommerce_app/screens/products/products_page.dart';
import 'package:mcommerce_app/widgets/statefull/input_search.dart';
import 'package:mcommerce_app/widgets/statefull/slider_widget.dart';
import 'package:mcommerce_app/widgets/stateless/layout-widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      appBar: PreferredSize(
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.subject_outlined,
                  color: AppColors.white,
                  size: 24,
                )),
            title: Row(
              children: [
                Text("ME",
                    style: TextStyle(
                        color: AppColors.yellow,
                        fontFamily: AppFontFamily.fontThird,
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                        letterSpacing: 1)),
                Text(
                  "SPORTS",
                  style: TextStyle(
                      color: AppColors.white,
                      fontFamily: AppFontFamily.fontThird,
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
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
                    Icons.notifications_active_outlined,
                    color: AppColors.white,
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
          ),
          preferredSize: Size.fromHeight(110.0)),
      body: Container(
        decoration: BoxDecoration(color: AppColors.bg),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
        child: SingleChildScrollView(
          child: Column(children: [
            SliderWidget(),
            SlideCategoryWidget(),
            ProductsPage(
              title: 'Featured',
            )
          ]),
        ),
      ),
    );
  }
}
