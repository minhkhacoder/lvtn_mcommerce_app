import 'package:alan_voice/alan_voice.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mcommerce_app/config/routes/routes.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';
import 'package:mcommerce_app/screens/home/widgets/slide_category_widget.dart';
import 'package:mcommerce_app/screens/products/products_page.dart';
import 'package:mcommerce_app/widgets/statefull/input_search.dart';
import 'package:mcommerce_app/widgets/statefull/slider_widget.dart';
import 'package:mcommerce_app/widgets/stateless/layout-widget.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';
import '../../providers/delivery_provider.dart';
import '../../providers/payment_provider.dart';
import '../../providers/search_provider.dart';
import '../search/search_key_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    setupAlan();
  }

  void setupAlan() {
    AlanVoice.addButton(
      "7494e9655df475ddccdf1513dc71add62e956eca572e1d8b807a3e2338fdd0dc/stage",
      buttonAlign: AlanVoice.BUTTON_ALIGN_RIGHT,
    );
    AlanVoice.callbacks.add((command) => handleCommand(command.data));
  }

  void handleCommand(Map<String, dynamic> command) {
    print("command $command");
    switch (command["command"]) {
      case "navigation":
        navigateTo(command["route"]);
        break;
      case "screen":
        navigateTo(command["data"]);
        break;
      case "search":
        search(command['key']);
        break;
      default:
    }
  }

  void navigateTo(String screen) {
    switch (screen) {
      case "/cart":
        Navigator.pushNamed(context, Routes.cartPage);
        break;
      case "/home":
        Navigator.pushNamed(context, Routes.homePage);
        break;
      case "/checkout":
        navigateToCheckOut();
        break;
      case "back":
        Navigator.pop(context);
        break;
      default:
    }
  }

  void navigateToCheckOut() async {
    final cartProvider = context.read<CartProvider>();
    if (cartProvider.carts.isNotEmpty) {
      final deliveryProvider = context.read<DeliveryProvider>();
      final paymentProvider = context.read<PaymentProvider>();
      await deliveryProvider.fetchDeliveries();
      await paymentProvider.fetchPayments();
      Navigator.pushNamed(context, Routes.orderPage);
    } else {
      Fluttertoast.showToast(
        msg: "Your cart is empty!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: AppColors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      Navigator.pushNamed(context, Routes.homePage);
    }
  }

  void search(String key) async {
    final searchProvider = context.read<SearchProvider>();
    await searchProvider.searchProductByKey(key);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchKeyPage(title: key)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      appBar: PreferredSize(
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.subject_outlined,
              color: AppColors.white,
              size: 24,
            ),
          ),
          title: Row(
            children: [
              Text("ME",
                  style: TextStyle(
                      color: AppColors.yellow,
                      fontFamily: AppFontFamily.fontThird,
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                      letterSpacing: 1)),
              Text(
                "SPORTS",
                style: TextStyle(
                    color: AppColors.white,
                    fontFamily: AppFontFamily.fontThird,
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
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
              borderRadius: BorderRadius.all(const Radius.circular(14.0)),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_active_outlined,
                color: AppColors.white,
                size: 24,
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(44.0),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InputSearch(
                hintsText: "What are you looking for?",
              ),
            ),
          ),
        ),
        preferredSize: const Size.fromHeight(110.0),
      ),
      body: Container(
        decoration: BoxDecoration(color: AppColors.bg),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              SliderWidget(),
              SlideCategoryWidget(),
              ProductsPage(title: 'Featured'),
            ],
          ),
        ),
      ),
    );
  }
}
