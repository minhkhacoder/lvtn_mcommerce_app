import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/routes/routes.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';
import 'package:mcommerce_app/models/cart_model.dart';
import 'package:mcommerce_app/providers/auth_provider.dart';
import 'package:mcommerce_app/providers/cart_provider.dart';
import 'package:mcommerce_app/providers/product_provider.dart';
import 'package:mcommerce_app/screens/auth/widgets/info_store_widget.dart';
import 'package:mcommerce_app/screens/products/widgets/item_cart_widget.dart';
import 'package:mcommerce_app/screens/products/widgets/price_product_widget.dart';
import 'package:mcommerce_app/screens/products/widgets/product_description_widget.dart';
import 'package:mcommerce_app/screens/products/widgets/product_slide_widget.dart';
import 'package:mcommerce_app/screens/products/widgets/review_product_widget.dart';
import 'package:mcommerce_app/widgets/stateless/star_widget.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatefulWidget {
  final Map<String, dynamic> item;
  final int selectedIndex;
  const ProductDetailPage(
      {Key? key, required this.item, this.selectedIndex = 0})
      : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int currentIndex = 0;
  bool isOpenItemProduct = false;
  final CarouselController carouselController = CarouselController();
  bool _isLoading = true;
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (mounted) {
      // kiểm tra xem widget đã bị dispose hay chưa
      Provider.of<ProductProvider>(context, listen: false).fetchProducts();
    }
  }

  int quantity = 1;
  String id = "";
  void handleQuantityChanged(int newQuantity, String newId) {
    setState(() {
      quantity = newQuantity;
      id = newId;
    });
  }

  void handleAddToCart() {
    setState(() {
      isOpenItemProduct = !isOpenItemProduct;
    });
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (authProvider.isAuthenticated != true) {
      Navigator.pushNamed(context, Routes.loginPage);
    } else {
      if (isOpenItemProduct == false) {
        final cartProvider = Provider.of<CartProvider>(context, listen: false);
        cartProvider.addToCart(Cart(
          id: widget.item['id'],
          name: widget.item['name'],
          price: widget.item['price'],
          image: widget.item['image'],
          quantity: quantity,
        ).toJson());
        Navigator.pushNamed(context, Routes.cartPage);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> images = widget.item["image"];
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 30.0),
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
                    items: images
                        .map((item) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 6.0),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                child: CachedNetworkImage(
                                  imageUrl: item.toString(),
                                  fadeInDuration: Duration(milliseconds: 300),
                                  fadeOutDuration: Duration(milliseconds: 300),
                                  imageBuilder: (context, imageProvider) {
                                    _isLoading = false;
                                    return Container(
                                      width: double.infinity,
                                      height: 375.0,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.contain)),
                                    );
                                  },
                                  placeholder: (context, url) {
                                    return _isLoading
                                        ? Container(
                                            width: double.infinity,
                                            height: 375.0,
                                            child: Center(
                                              child: CircularProgressIndicator(
                                                color: AppColors.primary,
                                              ),
                                            ),
                                          )
                                        : Container();
                                  },
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    width: double.infinity,
                                    height: 375.0,
                                    child: Icon(Icons.error),
                                  ),
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
                  children: images
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
                            '${widget.item["rat_count"].toString()} reviews',
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
                      Text(
                        widget.item["name"].toString(),
                        style: TextStyle(
                            color: AppColors.dark,
                            fontFamily: AppFontFamily.fontSecondary,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            letterSpacing: -0.15),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      PriceProductWidget(
                          originalPrice:
                              double.parse(widget.item["price"].toString()),
                          fontSize: 28),
                      SizedBox(
                        height: 24.0,
                      ),
                      InfoStoreWidget(
                        seller: widget.item["seller"],
                      )
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
                        description: widget.item["desc"].toString())),
                ReviewProductWidget(),
              ],
            ),
          ),
          Consumer<ProductProvider>(
            builder: (context, productProvider, child) {
              if (productProvider.isLoading) {
                return Center(
                    child: CircularProgressIndicator(
                  color: AppColors.primary,
                ));
              } else {
                return ProductSlideWidget(products: productProvider.products);
              }
            },
          ),
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
                  ItemCartWidget(
                    product: widget.item,
                    onQuantityChanged: handleQuantityChanged,
                  ),
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
                        onPressed: handleAddToCart,
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
