import 'package:flutter/material.dart';
import 'package:mcommerce_app/models/product_model.dart';
import 'package:mcommerce_app/providers/product_provider.dart';
import 'package:mcommerce_app/providers/rating_provider.dart';
import 'package:mcommerce_app/screens/products/product_detail_page.dart';
import 'package:mcommerce_app/screens/products/widgets/image_product_widget.dart';
import 'package:mcommerce_app/screens/products/widgets/price_product_widget.dart';
import 'package:mcommerce_app/screens/products/widgets/title_product_widget.dart';
import 'package:mcommerce_app/widgets/stateless/star_widget.dart';
import 'package:provider/provider.dart';

class ItemProductWidget extends StatelessWidget {
  final List<Data> products;

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
              Consumer<ProductProvider>(
                builder: (context, productProvider, _) {
                  return InkWell(
                    onTap: () async {
                      final ratingProvider =
                          Provider.of<RatingProvider>(context, listen: false);
                      await ratingProvider
                          .fetchAllRatingByProductId(item.id.toString());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailPage(item: item.toJson()),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.zero,
                      child: ImageProductWidget(
                        product: item,
                        isHeart: false,
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: StarWidget(
                  count: item.averageRating,
                  point: item.ratCount,
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 8.0),
                child: TitleProductWidget(
                  title: item.name.toString(),
                ),
              ),
              Container(
                child: PriceProductWidget(
                  originalPrice: double.parse(item.price.toString()),
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
