import 'package:flutter/material.dart';
import 'package:mcommerce_app/screens/auth/login_page.dart';
import 'package:mcommerce_app/screens/auth/signup_page.dart';
import 'package:mcommerce_app/screens/cart/cart_page.dart';
import 'package:mcommerce_app/screens/categories/category_page.dart';
import 'package:mcommerce_app/screens/home/get_started_page.dart';
import 'package:mcommerce_app/screens/home/home_page.dart';
import 'package:mcommerce_app/screens/orders/order_page.dart';
import 'package:mcommerce_app/screens/products/product_detail_page.dart';
import 'package:mcommerce_app/widgets/stateless/layout-widget.dart';

class Routers {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "HomePage":
        {
          return MaterialPageRoute(builder: (_) => HomePage());
        }
      case "GetStartedPage":
        {
          return MaterialPageRoute(builder: (_) => GetStartedPage());
        }
      case "LoginPage":
        {
          return MaterialPageRoute(builder: (_) => LoginPage());
        }
      case "SignUpPage":
        {
          return MaterialPageRoute(builder: (_) => SignUpPage());
        }
      case "CategoryPage":
        {
          return MaterialPageRoute(builder: (_) => CategoryPage());
        }
      case "LayoutPage":
        {
          return MaterialPageRoute(builder: (_) => LayoutWidget());
        }
      case "CartPage":
        {
          return MaterialPageRoute(builder: (_) => CartPage());
        }
      case "OrderPage":
        {
          return MaterialPageRoute(builder: (_) => OrderPage());
        }
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Page not found'),
        ),
      );
    });
  }
}
