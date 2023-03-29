import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/models/product_model.dart';
import 'package:mcommerce_app/screens/products/product_detail_page.dart';
import 'package:mcommerce_app/screens/products/widgets/image_product_widget.dart';
import 'package:mcommerce_app/screens/products/widgets/price_product_widget.dart';
import 'package:mcommerce_app/screens/products/widgets/title_product_widget.dart';
import 'package:mcommerce_app/widgets/stateless/heading_widget.dart';
import 'package:mcommerce_app/widgets/stateless/star_widget.dart';

class ProductSlideWidget extends StatefulWidget {
  final List<Data> products;
  const ProductSlideWidget({Key? key, required this.products})
      : super(key: key);

  @override
  _ProductSlideWidgetState createState() => _ProductSlideWidgetState();
}

class _ProductSlideWidgetState extends State<ProductSlideWidget> {
  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
      padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      decoration: BoxDecoration(
          // color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Column(
        children: [
          HeadingWidget(title: "Products related to this item"),
          Column(children: [
            Stack(
              children: [
                InkWell(
                  onTap: () {
                    print(currentIndex);
                  },
                  child: CarouselSlider(
                    items: widget.products.map((item) {
                      String url = item.image != null && item.image!.isNotEmpty
                          ? item.image![0]
                          : '';
                      return Container(
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         ProductDetailPage(products: item),
                                //   ),
                                // );
                              },
                              child: Padding(
                                padding: EdgeInsets.zero,
                                child: ImageProductWidget(
                                  image_url: url,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: StarWidget(
                                count: 5,
                                point: 5,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Container(
                                  child: TitleProductWidget(
                                title: item.name.toString(),
                              )),
                            ),
                            Container(
                              child: PriceProductWidget(
                                originalPrice:
                                    double.parse(item.price.toString()),
                                hasSale: false,
                              ),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                      height: 300.0,
                      scrollPhysics: BouncingScrollPhysics(),
                      aspectRatio: 1,
                      viewportFraction: 0.5,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ])
        ],
      ),
    );
  }
}
