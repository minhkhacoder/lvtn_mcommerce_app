import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/screens/home/widgets/slide_category_widget.dart';
import 'package:mcommerce_app/screens/products/products_page.dart';
import 'package:mcommerce_app/widgets/statefull/slider_widget.dart';

class HomeBodyWidget extends StatefulWidget {
  const HomeBodyWidget({Key? key}) : super(key: key);

  @override
  _HomeBodyWidgetState createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<HomeBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.bg),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
      child: SingleChildScrollView(
        child: Column(
            children: [SliderWidget(), SlideCategoryWidget(), ProductsPage()]),
      ),
    );
  }
}
