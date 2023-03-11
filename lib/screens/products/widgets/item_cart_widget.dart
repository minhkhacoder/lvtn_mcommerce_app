import 'package:flutter/material.dart';
import 'package:mcommerce_app/screens/products/widgets/price_product_widget.dart';
import 'package:mcommerce_app/screens/products/widgets/quantity_widget.dart';
import 'package:mcommerce_app/screens/products/widgets/title_product_widget.dart';

class ItemCartWidget extends StatefulWidget {
  final Map<String, dynamic> products;
  const ItemCartWidget({Key? key, required this.products}) : super(key: key);

  @override
  _ItemCartWidgetState createState() => _ItemCartWidgetState();
}

class _ItemCartWidgetState extends State<ItemCartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 12.0),
            child: Row(
              children: [
                Image.network(
                  widget.products["pro_image"],
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 16.0,
                ),
                SizedBox(
                  width: 215.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleProductWidget(
                          title: widget.products["pro_name"], fontSize: 18),
                      SizedBox(
                        height: 16.0,
                      ),
                      PriceProductWidget(originalPrice: 249.99, fontSize: 24)
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: QuantityWidget(),
          )
        ],
      ),
    );
  }
}
