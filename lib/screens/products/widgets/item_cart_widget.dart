import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/screens/products/widgets/price_product_widget.dart';
import 'package:mcommerce_app/screens/products/widgets/quantity_widget.dart';
import 'package:mcommerce_app/screens/products/widgets/title_product_widget.dart';

class ItemCartWidget extends StatefulWidget {
  final Map<String, dynamic> product;
  const ItemCartWidget({Key? key, required this.product}) : super(key: key);

  @override
  _ItemCartWidgetState createState() => _ItemCartWidgetState();
}

class _ItemCartWidgetState extends State<ItemCartWidget> {
  bool _isLoading = true;
  @override
  Widget build(BuildContext context) {
    String url =
        widget.product["image"] != null && widget.product["image"]!.isNotEmpty
            ? widget.product["image"]![0]
            : '';
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 12.0),
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: url,
                  fadeInDuration: Duration(milliseconds: 300),
                  fadeOutDuration: Duration(milliseconds: 300),
                  imageBuilder: (context, imageProvider) {
                    _isLoading = false;
                    return Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.contain)),
                    );
                  },
                  placeholder: (context, url) {
                    return _isLoading
                        ? Container(
                            width: 80.0,
                            height: 80.0,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primary,
                              ),
                            ),
                          )
                        : Container();
                  },
                  errorWidget: (context, url, error) => Container(
                    width: 80.0,
                    height: 80.0,
                    child: Icon(Icons.error),
                  ),
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
                          title: widget.product["name"], fontSize: 18),
                      SizedBox(
                        height: 16.0,
                      ),
                      PriceProductWidget(
                          originalPrice: double.parse(widget.product["price"]),
                          fontSize: 24)
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
