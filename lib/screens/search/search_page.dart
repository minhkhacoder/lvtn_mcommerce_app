import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/screens/products/products_page.dart';
import 'package:mcommerce_app/screens/search/widgets/app_bar_search_widget.dart';
import 'package:mcommerce_app/widgets/stateless/layout-widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarSearchWidget(), preferredSize: Size.fromHeight(110.0)),
      body: Container(
        decoration: BoxDecoration(color: AppColors.bg),
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            ProductsPage(
              title: 'Results: 4 items',
            )
          ]),
        ),
      ),
    );
  }
}
