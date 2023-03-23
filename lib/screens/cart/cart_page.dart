import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/routes/routes.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';
import 'package:mcommerce_app/providers/cart_provider.dart';
import 'package:mcommerce_app/screens/products/widgets/item_cart_widget.dart';
import 'package:mcommerce_app/widgets/stateless/button_widget.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final formatter = NumberFormat.currency(
      symbol: '\$', // ký hiệu tiền tệ
      decimalDigits: 2, // số chữ số thập phân
    );
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.layoutPage);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.white,
                  size: 24,
                )),
            title: Row(
              children: [
                Text(
                  "Cart",
                  style: TextStyle(
                      color: AppColors.white,
                      fontFamily: AppFontFamily.fontThird,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      letterSpacing: 1),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.primary,
                      AppColors.third,
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(14.0))),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_active_outlined,
                    color: Colors.transparent,
                    size: 24,
                  )),
            ],
          ),
          preferredSize: Size.fromHeight(70.0)),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: ListView(children: [
          cartProvider.carts.length > 0
              ? GridView.count(
                  crossAxisCount: 1,
                  childAspectRatio: 3,
                  shrinkWrap: true,
                  mainAxisSpacing: 16.0,
                  // crossAxisSpacing: 16.0,
                  physics: NeverScrollableScrollPhysics(),
                  children: cartProvider.carts.map(((cart) {
                    return ItemCartWidget(
                      product: {
                        'id': cart.id,
                        'name': cart.name,
                        'price': cart.price,
                        'image': cart.image,
                        'quantity': cart.quantity
                      },
                    );
                  })).toList(),
                )
              : Container(
                  height: MediaQuery.of(context).size.height / 1.2,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.homePage);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          child: Image.asset(
                            "assets/images/empty-cart.png",
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        Text(
                          "Your cart is empty!",
                          style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 20,
                              fontFamily: AppFontFamily.fontSecondary,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
        ]),
      ),
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
          height: 140,
          padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5,
                spreadRadius: 2,
                offset: Offset(0, 3),
              ),
            ],
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total price:",
                    style: TextStyle(
                        color: AppColors.dark,
                        fontFamily: AppFontFamily.fontSecondary,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    formatter.format(cartProvider.totalPrice),
                    style: TextStyle(
                        color: AppColors.dark,
                        fontFamily: AppFontFamily.fontSecondary,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
              Container(
                  padding: const EdgeInsets.only(top: 16),
                  width: MediaQuery.of(context).size.width,
                  child: ButtonWidget(label: "Check out", onPressed: () {}))
            ],
          ),
        ),
      ),
    );
  }
}
