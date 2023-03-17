import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';

class SliderWidget extends StatefulWidget {
  final double height;
  const SliderWidget({Key? key, this.height = 120.0}) : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  List salesData = [
    {
      "id": 1,
      "image_path":
          'https://images.unsplash.com/photo-1503669678209-c68d00b3765d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
    },
    {
      "id": 2,
      "image_path":
          'https://images.unsplash.com/photo-1541584285245-c83a93cce0e8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80'
    },
    {
      "id": 3,
      "image_path":
          'https://images.unsplash.com/photo-1605235186531-bbd852b09e69?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
    },
  ];

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              print(currentIndex);
            },
            child: CarouselSlider(
              items: salesData
                  .map((item) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF1D2332).withOpacity(0.2),
                              Color(0xFF34283E),
                            ],
                            stops: [0.0347, 0.6748],
                          ),
                        ),
                        child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            child: Stack(
                              children: [
                                Image.asset(
                                  "assets/images/sale1.png",
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                                Positioned(
                                    child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Cycling Sale",
                                        style: TextStyle(
                                          fontFamily: AppFontFamily.fontPrimary,
                                          fontSize: 24,
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                      InkWell(
                                          onTap: (() {}),
                                          child: Text(
                                            "See More",
                                            style: TextStyle(
                                              fontFamily:
                                                  AppFontFamily.fontSecondary,
                                              fontSize: 14,
                                              color: AppColors.yellow,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 1,
                                            ),
                                          ))
                                    ],
                                  ),
                                ))
                              ],
                            )),
                      ))
                  .toList(),
              carouselController: carouselController,
              options: CarouselOptions(
                height: widget.height,
                scrollPhysics: BouncingScrollPhysics(),
                // autoPlay: true,
                aspectRatio: 2,
                viewportFraction: 1,
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
    );
  }
}
