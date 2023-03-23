import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  // final List<Map<String, dynamic>> products = [
  //   {
  //     "pro_id": "PRO01",
  //     "pro_name": "6KU Track Fixed Gear Bicycle",
  //     "pro_price": 249.99,
  //     "pro_image":
  //         "https://m.media-amazon.com/images/I/71zYYN1n5jL._AC_SL1500_.jpg",
  //     "children": [
  //       {
  //         "child":
  //             "https://m.media-amazon.com/images/I/71zYYN1n5jL._AC_SL1500_.jpg"
  //       },
  //       {
  //         "child":
  //             "https://m.media-amazon.com/images/I/71eThOOEvFL._AC_SX679_.jpg"
  //       },
  //       {
  //         "child":
  //             "https://m.media-amazon.com/images/I/71ClPNNV7DL._AC_SX679_.jpg"
  //       }
  //     ]
  //   },
  //   {
  //     "pro_id": "PRO02",
  //     "pro_name": "6KU Track Fixed Gear Bicycle",
  //     "pro_price": 249.99,
  //     "pro_image":
  //         "https://m.media-amazon.com/images/I/71zYYN1n5jL._AC_SL1500_.jpg"
  //   },
  //   {
  //     "pro_id": "PRO03",
  //     "pro_name": "6KU Track Fixed Gear Bicycle",
  //     "pro_price": 249.99,
  //     "pro_image":
  //         "https://m.media-amazon.com/images/I/71zYYN1n5jL._AC_SL1500_.jpg"
  //   },
  //   {
  //     "pro_id": "PRO04",
  //     "pro_name": "6KU Track Fixed Gear Bicycle",
  //     "pro_price": 249.99,
  //     "pro_image":
  //         "https://m.media-amazon.com/images/I/71zYYN1n5jL._AC_SL1500_.jpg"
  //   },
  // ]
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
