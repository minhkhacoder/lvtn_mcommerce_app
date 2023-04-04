import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/providers/product_provider.dart';
import 'package:mcommerce_app/screens/products/widgets/item_product_widget.dart';
import 'package:mcommerce_app/widgets/stateless/heading_widget.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatefulWidget {
  final String title;
  const ProductsPage({Key? key, required this.title}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (mounted) {
      // kiểm tra xem widget đã bị dispose hay chưa
      Provider.of<ProductProvider>(context, listen: false).fetchProducts();
    }
  }

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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Text(
              //       "Sort by: ",
              //       style: TextStyle(color: AppColors.darkGray, fontSize: 16),
              //     )
              //   ],
              // )
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Consumer<ProductProvider>(
            builder: (context, productProvider, child) {
              if (productProvider.isLoading) {
                return Center(
                    child: CircularProgressIndicator(
                  color: AppColors.primary,
                ));
              } else {
                return ItemProductWidget(products: productProvider.products);
              }
            },
          ),
        ],
      ),
    );
  }
}
