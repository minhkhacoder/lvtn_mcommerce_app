import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';
import 'package:mcommerce_app/screens/auth/widgets/info_store_widget.dart';
import 'package:mcommerce_app/screens/products/widgets/item_cart_widget.dart';
import 'package:mcommerce_app/screens/products/widgets/price_product_widget.dart';
import 'package:mcommerce_app/screens/products/widgets/product_description_widget.dart';
import 'package:mcommerce_app/screens/products/widgets/product_slide_widget.dart';
import 'package:mcommerce_app/screens/products/widgets/quantity_widget.dart';
import 'package:mcommerce_app/screens/products/widgets/review_product_widget.dart';
import 'package:mcommerce_app/screens/products/widgets/title_product_widget.dart';
import 'package:mcommerce_app/widgets/stateless/star_widget.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, dynamic> products;
  final int selectedIndex;
  const ProductDetailPage(
      {Key? key, required this.products, this.selectedIndex = 0})
      : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int currentIndex = 0;
  bool isOpenItemProduct = false;
  final CarouselController carouselController = CarouselController();

  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 30.0, bottom: 16.0),
            decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 5,
                    spreadRadius: 2,
                    offset: Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0))),
            child: Column(
              children: [
                SizedBox(
                  child: CarouselSlider(
                    items: widget.products["children"]
                        .map<Widget>((item) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 6.0),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                child: Image.network(
                                  item["child"],
                                  width: MediaQuery.of(context).size.width,
                                  height: 375,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ))
                        .toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                      height: 375.0,
                      scrollPhysics: BouncingScrollPhysics(),
                      aspectRatio: 16 / 9,
                      viewportFraction: 2,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.products["children"]
                      .asMap()
                      .entries
                      .map<Widget>((entry) => GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = entry.key;
                              });
                              carouselController.animateToPage(
                                entry.key,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 6.0, vertical: 6.0),
                              width: 8.0,
                              height: 8.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentIndex == entry.key
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                          ))
                      .toList(),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          StarWidget(),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "8 reviews",
                            style: TextStyle(
                                color: AppColors.darkGray,
                                fontFamily: AppFontFamily.fontSecondary,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      TitleProductWidget(
                          title: widget.products["pro_name"], fontSize: 18),
                      SizedBox(
                        height: 16.0,
                      ),
                      PriceProductWidget(originalPrice: 249.99, fontSize: 30),
                      SizedBox(
                        height: 24.0,
                      ),
                      InfoStoreWidget()
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: ProductDescriptionWidget(
                  description:
                      "A play on speed and style, the Urban Track takes the street head-on with no regrets. With its performance inspired aluminium frame and fork paired with comfortable riser handlebars, you can effortlessly navigate whatever life throws at you while looking your best. We love how it can fit any occasion.")),
          ReviewProductWidget(),
          ProductSlideWidget()
        ],
      )),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.white,
        shape: AutomaticNotchedShape(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
          ),
          StadiumBorder(side: BorderSide.none),
        ),
        notchMargin: 2.0,
        child: Container(
          height: isOpenItemProduct
              ? MediaQuery.of(context).size.height * 0.3
              : 120.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 28.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.dark.withOpacity(0.3),
                blurRadius: 5,
                spreadRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: isOpenItemProduct
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (isOpenItemProduct)
                  ItemCartWidget(products: widget.products),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                        onPressed: (() {
                          Navigator.of(context).pop();
                          setState(() {
                            isOpenItemProduct = false;
                          });
                        }),
                        icon: Icon(
                          Icons.keyboard_backspace,
                          color: AppColors.darkGray,
                          size: 34.0,
                        )),
                    Container(
                      width: 230.0,
                      height: 48.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.primary, AppColors.third],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextButton(
                        onPressed: (() {
                          setState(() {
                            isOpenItemProduct = true;
                          });
                        }),
                        child: Text(
                          "Add to Cart",
                          style:
                              TextStyle(color: AppColors.white, fontSize: 18),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: (() {}),
                        icon: Icon(
                          Icons.favorite_outline,
                          color: AppColors.primary,
                          size: 34.0,
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
