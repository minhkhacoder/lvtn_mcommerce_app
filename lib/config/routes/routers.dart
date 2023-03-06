import 'package:flutter/material.dart';
import 'package:mcommerce_app/modules/auth/login_page.dart';
import 'package:mcommerce_app/modules/auth/signup_page.dart';
import 'package:mcommerce_app/modules/home/get_started_page.dart';
import 'package:mcommerce_app/modules/home/home_page.dart';

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
