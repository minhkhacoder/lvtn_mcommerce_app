import 'package:fluttertoast/fluttertoast.dart';
import 'package:mcommerce_app/config/routes/routes.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:mcommerce_app/providers/auth_provider.dart';
import 'package:mcommerce_app/providers/cart_provider.dart';
import 'package:mcommerce_app/screens/auth/widgets/login_form.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return FutureBuilder<void>(
      future: _navigateToNextPage(context, authProvider, cartProvider),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            body: ListView(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(color: AppColors.white),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          padding:
                              EdgeInsets.only(top: 292, left: 24, right: 24),
                          decoration: BoxDecoration(color: AppColors.white),
                          child: const LoginForm(),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[
                                  Color(0xff8E2DE2),
                                  Color(0xff4A00E0),
                                ],
                                tileMode: TileMode.mirror,
                              ),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(250))),
                          child: Column(children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding:
                                  EdgeInsets.only(top: 90, left: 24, bottom: 8),
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontFamily: AppFontFamily.fontPrimary,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.white,
                                    letterSpacing: 1),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 24),
                              child: Text(
                                "Enter your phone and password",
                                style: TextStyle(
                                    fontFamily: AppFontFamily.fontSecondary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white,
                                    letterSpacing: 1),
                              ),
                            )
                          ]),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Future<void> _navigateToNextPage(BuildContext context,
      AuthProvider authProvider, CartProvider cartProvider) async {
    await authProvider.loadUserData();
    if (authProvider.user != null) {
      await cartProvider.loadCart();
      Fluttertoast.showToast(
        msg: "Login successfully!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: AppColors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      Navigator.pushNamed(context, Routes.homePage);
    }
  }
}
