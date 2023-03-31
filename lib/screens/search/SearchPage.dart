import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/providers/search_provider.dart';
import 'package:mcommerce_app/screens/products/widgets/item_product_widget.dart';
import 'package:mcommerce_app/widgets/stateless/heading_widget.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  final String title;
  const SearchPage({Key? key, required this.title}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 6.0, right: 6.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeadingWidget(title: widget.title),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Consumer<SearchProvider>(
            builder: (context, searchProvider, child) {
              if (searchProvider.isLoading) {
                return Center(
                    child: CircularProgressIndicator(
                  color: AppColors.primary,
                ));
              } else {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: ItemProductWidget(products: searchProvider.products),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
