import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/routes/routes.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';
import 'package:mcommerce_app/widgets/stateless/button_widget.dart';

class SuccessModal extends StatefulWidget {
  const SuccessModal({Key? key}) : super(key: key);

  @override
  _SuccessModalState createState() => _SuccessModalState();
}

class _SuccessModalState extends State<SuccessModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  EdgeInsets.only(top: 214, left: 24, right: 24, bottom: 22),
              decoration: BoxDecoration(color: AppColors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      "Success",
                      style: TextStyle(
                          color: AppColors.dark,
                          fontFamily: AppFontFamily.fontSecondary,
                          fontSize: 28,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      "Your order will be delivered soon. It can be tracked in the Orders section.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.darkGray,
                          fontFamily: AppFontFamily.fontSecondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ButtonWidget(
                        label: "Continue Shopping",
                        onPressed: () async {
                          Navigator.pushNamed(context, Routes.homePage);
                        }),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      side: MaterialStateProperty.all<BorderSide>(
                          BorderSide.none),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.zero),
                    ),
                    child: Text(
                      "Go to order",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.darkGray,
                          fontFamily: AppFontFamily.fontSecondary,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
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
                      bottomRight: Radius.circular(200),
                      bottomLeft: Radius.circular(200))),
              child: Icon(
                Icons.check_circle_outline,
                size: 100,
                color: AppColors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
