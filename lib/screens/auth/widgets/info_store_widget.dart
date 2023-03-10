import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';
import 'package:mcommerce_app/screens/auth/widgets/info_param_widget.dart';

class InfoStoreWidget extends StatelessWidget {
  const InfoStoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Image.network(
                      "https://images.unsplash.com/photo-1604699229817-27301bdfed68?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80",
                      width: 60.0,
                      height: 60.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 14.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "storesport",
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: AppFontFamily.fontPrimary,
                            fontWeight: FontWeight.w500,
                            color: AppColors.dark,
                            letterSpacing: 0.35),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.green,
                          ),
                          Text(
                            "United States",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: AppFontFamily.fontSecondary,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.35,
                                color: AppColors.gray),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              Container(
                width: 96.0,
                height: 30.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primary, AppColors.third],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextButton(
                  onPressed: (() {}),
                  child: Text(
                    "View Shop",
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InfoParamWidget(number: "72", text: "products"),
              InfoParamWidget(number: "4.9", text: "reviews"),
              InfoParamWidget(number: "99%", text: "response Chat")
            ],
          ),
        ],
      ),
    );
  }
}
