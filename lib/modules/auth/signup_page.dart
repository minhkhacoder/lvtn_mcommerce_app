import 'package:mcommerce_app/config/themes/app_font_family.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:mcommerce_app/modules/auth/widgets/signup_form.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
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
                padding: EdgeInsets.only(top: 280, left: 24, right: 24),
                decoration: BoxDecoration(color: AppColors.white),
                child: SignUpForm(),
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
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(250))),
                child: Column(children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 90, left: 24, bottom: 8),
                    child: Text(
                      "SIGNUP",
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
                      "Enter your credentials to continue",
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
    );
  }
}
