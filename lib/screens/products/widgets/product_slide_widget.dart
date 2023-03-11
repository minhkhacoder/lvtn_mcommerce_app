import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/screens/products/product_detail_page.dart';
import 'package:mcommerce_app/screens/products/widgets/image_product_widget.dart';
import 'package:mcommerce_app/screens/products/widgets/price_product_widget.dart';
import 'package:mcommerce_app/screens/products/widgets/title_product_widget.dart';
import 'package:mcommerce_app/widgets/stateless/heading_widget.dart';
import 'package:mcommerce_app/widgets/stateless/star_widget.dart';

class ProductSlideWidget extends StatefulWidget {
  const ProductSlideWidget({Key? key}) : super(key: key);

  @override
  _ProductSlideWidgetState createState() => _ProductSlideWidgetState();
}

class _ProductSlideWidgetState extends State<ProductSlideWidget> {
  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {
        "pro_id": "PRO01",
        "pro_name": "6KU Track Fixed Gear Bicycle",
        "pro_price": 249.99,
        "pro_image":
            "https://m.media-amazon.com/images/I/71zYYN1n5jL._AC_SL1500_.jpg",
        "children": [
          {
            "child":
                "https://m.media-amazon.com/images/I/71zYYN1n5jL._AC_SL1500_.jpg"
          },
          {
            "child":
                "https://m.media-amazon.com/images/I/71eThOOEvFL._AC_SX679_.jpg"
          },
          {
            "child":
                "https://m.media-amazon.com/images/I/71ClPNNV7DL._AC_SX679_.jpg"
          }
        ]
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
                    items: products.map((item) {
                      return Container(
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetailPage(products: item),
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
