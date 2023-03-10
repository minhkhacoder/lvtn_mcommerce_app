import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/routes/routes.dart';
import 'package:mcommerce_app/screens/products/product_detail_page.dart';
import 'package:mcommerce_app/screens/products/widgets/image_product_widget.dart';
import 'package:mcommerce_app/screens/products/widgets/price_product_widget.dart';
import 'package:mcommerce_app/screens/products/widgets/title_product_widget.dart';
import 'package:mcommerce_app/widgets/stateless/star_widget.dart';

class ItemProductWidget extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  const ItemProductWidget({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      shrinkWrap: true,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 16.0,
      physics: NeverScrollableScrollPhysics(),
      children: products.map((item) {
        return Container(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(product: item),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.zero,
                  child: ImageProductWidget(
                    image_url: item["pro_image"],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: StarWidget(),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Container(
                    child: TitleProductWidget(
                  title: item["pro_name"],
                )),
              ),
              Container(
                child: PriceProductWidget(
                  originalPrice: item["pro_price"],
                  hasSale: false,
                ),
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
