import 'package:flutter/widgets.dart';
import 'package:mcommerce_app/screens/products/widgets/item_product_widget.dart';
import 'package:mcommerce_app/widgets/stateless/heading_widget.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final List<Map<String, dynamic>> products = [
    {
      "pro_id": "PRO01",
      "pro_name": "6KU Track Fixed Gear Bicycle",
      "pro_price": 249.99,
      "pro_image":
          "https://m.media-amazon.com/images/I/71zYYN1n5jL._AC_SL1500_.jpg"
    },
    {
      "pro_id": "PRO02",
      "pro_name": "6KU Track Fixed Gear Bicycle",
      "pro_price": 249.99,
      "pro_image":
          "https://m.media-amazon.com/images/I/71zYYN1n5jL._AC_SL1500_.jpg"
    },
    {
      "pro_id": "PRO03",
      "pro_name": "6KU Track Fixed Gear Bicycle",
      "pro_price": 249.99,
      "pro_image":
          "https://m.media-amazon.com/images/I/71zYYN1n5jL._AC_SL1500_.jpg"
    },
    {
      "pro_id": "PRO04",
      "pro_name": "6KU Track Fixed Gear Bicycle",
      "pro_price": 249.99,
      "pro_image":
          "https://m.media-amazon.com/images/I/71zYYN1n5jL._AC_SL1500_.jpg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 6.0, right: 6.0, top: 24),
      child: Column(
        children: [
          HeadingWidget(title: "Featured"),
          ItemProductWidget(
            products: products,
          )
        ],
      ),
    );
  }
}
