import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';
import 'package:mcommerce_app/models/category_model.dart';
import 'package:mcommerce_app/providers/category_provider.dart';
import 'package:mcommerce_app/providers/search_provider.dart';
import 'package:mcommerce_app/screens/search/search_category_page.dart';
import 'package:mcommerce_app/widgets/stateless/heading_widget.dart';
import 'package:provider/provider.dart';
import 'package:mcommerce_app/utils/bottom_sheet_utils.dart'
    as bottomSheetUtils;

class SlideCategoryWidget extends StatefulWidget {
  const SlideCategoryWidget({Key? key}) : super(key: key);

  @override
  _SlideCategoryWidgetState createState() => _SlideCategoryWidgetState();
}

class _SlideCategoryWidgetState extends State<SlideCategoryWidget> {
  List categories = [
    {
      "id": "CAT01",
      "title": "Cycling",
      "image_path":
          'https://images.unsplash.com/photo-1499438075715-fc23ef376ab9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=821&q=80'
    },
    {
      "id": "CAT02",
      "title": "Golf",
      "image_path":
          'https://images.unsplash.com/photo-1621005570352-6418df03796b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
    },
    {
      "id": "CAT03",
      "title": "Running",
      "image_path":
          'https://images.unsplash.com/photo-1457470572216-1240fac24b37?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
    },
    {
      "id": "CAT04",
      "title": "Tennis",
      "image_path":
          'https://images.unsplash.com/photo-1560012057-4372e14c5085?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
    },
    {
      "id": "CAT05",
      "title": "Swimming",
      "image_path":
          'https://images.unsplash.com/photo-1600965962102-9d260a71890d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8U3dpbW1pbmd8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60'
    },
    {
      "id": "CAT06",
      "title": "Soccer",
      "image_path":
          'https://images.unsplash.com/photo-1579952363873-27f3bade9f55?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8U29jY2VyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60'
    },
    {
      "id": "CAT07",
      "title": "Football",
      "image_path":
          'https://images.unsplash.com/photo-1566579090262-51cde5ebe92e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHJ1Z2J5fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60'
    },
    {
      "id": "CAT08",
      "title": "Volleyball",
      "image_path":
          'https://images.unsplash.com/photo-1588492069485-d05b56b2831d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Vm9sbGV5YmFsbHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60'
    },
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  List<Childrens> cate = [];
  @override
  Widget build(BuildContext context) {
    final categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.0),
      child: Column(
        children: [
          HeadingWidget(
            title: "Categories",
            child: Container(),
          ),
          Column(children: [
            Stack(
              children: [
                InkWell(
                  onTap: () async {
                    print(currentIndex);
                  },
                  child: CarouselSlider(
                    items: categories
                        .map((item) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: [0.0, 1.0],
                                  colors: [
                                    Color.fromRGBO(52, 40, 62, 0.2),
                                    Color.fromRGBO(52, 40, 62, 1),
                                  ],
                                ),
                              ),
                              child: InkWell(
                                onTap: () async {
                                  cate = await categoryProvider
                                      .fetchCategoriesByParentId(item["id"]);
                                  if (cate.length > 0) {
                                    bottomSheetUtils.showBottomSheet(
                                        context,
                                        Container(
                                          padding: EdgeInsets.only(top: 20.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Center(
                                                child: Text(
                                                  item['title'],
                                                  style: TextStyle(
                                                      color: AppColors.dark,
                                                      fontFamily: AppFontFamily
                                                          .fontSecondary,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 12.0,
                                              ),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(left: 20.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: categoryProvider
                                                      .childrens
                                                      .map((child) {
                                                    return TextButton(
                                                      onPressed: () async {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  SearchCategoryPage(
                                                                child: child,
                                                              ),
                                                            ));
                                                        Provider.of<SearchProvider>(
                                                                context,
                                                                listen: false)
                                                            .searchAllProductByCategory(
                                                                child.id
                                                                    .toString());
                                                      },
                                                      child: Text(
                                                        child.label.toString(),
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .darkGray,
                                                            fontFamily:
                                                                AppFontFamily
                                                                    .fontSecondary,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                              )
                                            ],
                                          ),
                                        ));
                                  } else {
                                    bottomSheetUtils.showBottomSheet(
                                        context,
                                        Container(
                                            padding: EdgeInsets.only(top: 20.0),
                                            child:
                                                Text("Not children category")));
                                  }
                                },
                                child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    child: Stack(
                                      children: [
                                        ColorFiltered(
                                          colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.5),
                                            BlendMode.darken,
                                          ),
                                          child: Image.network(
                                            item["image_path"],
                                            width: 200,
                                            height: 200,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                            child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: Center(
                                            child: Text(
                                              item['title'],
                                              style: TextStyle(
                                                fontFamily:
                                                    AppFontFamily.fontPrimary,
                                                fontSize: 18,
                                                color: AppColors.white,
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: 1,
                                              ),
                                            ),
                                          ),
                                        ))
                                      ],
                                    )),
                              ),
                            ))
                        .toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                      height: 88.0,
                      scrollPhysics: BouncingScrollPhysics(),
                      aspectRatio: 2,
                      viewportFraction: 0.4,
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
