import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/providers/search_provider.dart';
import 'package:mcommerce_app/screens/search/SearchPage.dart';
import 'package:mcommerce_app/screens/search/widgets/app_bar_search_widget.dart';
import 'package:provider/provider.dart';

class SearchKeyPage extends StatefulWidget {
  final String title;
  const SearchKeyPage({Key? key, required this.title}) : super(key: key);

  @override
  _SearchKeyPageState createState() => _SearchKeyPageState();
}

class _SearchKeyPageState extends State<SearchKeyPage> {
  String quantity = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final searchProvider = Provider.of<SearchProvider>(context, listen: true);
    updateQuantity(searchProvider.products.length);
  }

  void updateQuantity(int length) {
    setState(() {
      quantity = length.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: PreferredSize(
          child: AppBarSearchWidget(
            title: "Search",
          ),
          preferredSize: Size.fromHeight(110.0)),
      body: int.parse(quantity) > 0
          ? Container(
              decoration: BoxDecoration(color: AppColors.bg),
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: SingleChildScrollView(
                child: Column(children: [
                  SearchPage(
                    title: int.parse(quantity) > 1
                        ? 'Results: $quantity items'
                        : 'Results: $quantity item',
                  )
                ]),
              ),
            )
          : Center(
              child: Text("No product found"),
            ),
    );
  }
}
