import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';

class ProductDetailItem extends StatefulWidget {
  const ProductDetailItem({Key? key}) : super(key: key);

  @override
  _ProductDetailItemState createState() => _ProductDetailItemState();
}

class _ProductDetailItemState extends State<ProductDetailItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(
        //   child: CarouselSlider(
        //     items: widget.products["children"]
        //         .map<Widget>((item) => Container(
        //               margin: EdgeInsets.symmetric(horizontal: 6.0),
        //               child: ClipRRect(
        //                 borderRadius:
        //                     BorderRadius.all(Radius.circular(8.0)),
        //                 child: Image.network(
        //                   item["child"],
        //                   width: MediaQuery.of(context).size.width,
        //                   height: 375,
        //                   fit: BoxFit.cover,
        //                 ),
        //               ),
        //             ))
        //         .toList(),
        //     carouselController: carouselController,
        //     options: CarouselOptions(
        //       height: 375.0,
        //       scrollPhysics: BouncingScrollPhysics(),
        //       aspectRatio: 16 / 9,
        //       viewportFraction: 2,
        //       onPageChanged: (index, reason) {
        //         setState(() {
        //           currentIndex = index;
        //         });
        //       },
        //     ),
        //   ),
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: widget.products["children"]
        //       .asMap()
        //       .entries
        //       .map<Widget>((entry) => GestureDetector(
        //             onTap: () {
        //               setState(() {
        //                 currentIndex = entry.key;
        //               });
        //               carouselController.animateToPage(
        //                 entry.key,
        //                 duration: Duration(milliseconds: 300),
        //                 curve: Curves.easeInOut,
        //               );
        //             },
        //             child: Container(
        //               margin: EdgeInsets.symmetric(
        //                   horizontal: 6.0, vertical: 6.0),
        //               width: 8.0,
        //               height: 8.0,
        //               decoration: BoxDecoration(
        //                 shape: BoxShape.circle,
        //                 color: currentIndex == entry.key
        //                     ? Colors.black
        //                     : Colors.grey,
        //               ),
        //             ),
        //           ))
        //       .toList(),
        // ),
        // Container(
        //   padding:
        //       EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Row(
        //         crossAxisAlignment: CrossAxisAlignment.end,
        //         children: [
        //           StarWidget(),
        //           SizedBox(
        //             width: 10.0,
        //           ),
        //           Text(
        //             "8 reviews",
        //             style: TextStyle(
        //                 color: AppColors.darkGray,
        //                 fontFamily: AppFontFamily.fontSecondary,
        //                 fontSize: 14,
        //                 fontWeight: FontWeight.w400),
        //           )
        //         ],
        //       ),
        //       SizedBox(
        //         height: 16.0,
        //       ),
        //       TitleProductWidget(
        //           title: widget.products["pro_name"], fontSize: 18),
        //       SizedBox(
        //         height: 16.0,
        //       ),
        //       PriceProductWidget(originalPrice: 249.99, fontSize: 30),
        //       SizedBox(
        //         height: 24.0,
        //       ),
        //       InfoStoreWidget()
        //     ],
        //   ),
        // ),
        //       Container(
        //     margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
        //     padding: EdgeInsets.only(left: 16.0, right: 16.0),
        //     decoration: BoxDecoration(
        //         color: AppColors.white,
        //         boxShadow: [
        //           BoxShadow(
        //             color: Colors.grey.withOpacity(0.5),
        //             blurRadius: 5,
        //             spreadRadius: 2,
        //             offset: Offset(0, 3),
        //           ),
        //         ],
        //         borderRadius: BorderRadius.all(Radius.circular(8.0))),
        //     child: ProductDescriptionWidget(
        //         description:
        //             "A play on speed and style, the Urban Track takes the street head-on with no regrets. With its performance inspired aluminium frame and fork paired with comfortable riser handlebars, you can effortlessly navigate whatever life throws at you while looking your best. We love how it can fit any occasion.")),
        // ReviewProductWidget(),
      ],
    );
  }
}
