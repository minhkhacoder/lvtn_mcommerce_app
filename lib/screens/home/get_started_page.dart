import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/routes/routes.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';
import 'package:mcommerce_app/widgets/stateless/button_widget.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  _GetStartedPageState createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    // return const GradientTtb();
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(color: Color(0xff4A00E0)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.6,
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
                  ),
                  child: Center(
                    child: Image.asset("assets/images/mesports1.png"),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.666,
                padding: EdgeInsets.only(top: 28),
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
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("ME",
                            style: TextStyle(
                                color: AppColors.yellow,
                                fontFamily: AppFontFamily.fontThird,
                                fontWeight: FontWeight.w800,
                                fontSize: 30,
                                letterSpacing: 1)),
                        Text(
                          "SPORTS",
                          style: TextStyle(
                              color: AppColors.white,
                              fontFamily: AppFontFamily.fontThird,
                              fontWeight: FontWeight.w800,
                              fontSize: 30,
                              letterSpacing: 1),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 28, left: 30, right: 30, bottom: 32),
                      child: Text(
                        "Quality sports equipment - Mesports - Equip your health",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.white,
                          fontFamily: AppFontFamily.fontSecondary,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    ButtonWidget(
                      label: "Get started",
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.loginPage);
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
