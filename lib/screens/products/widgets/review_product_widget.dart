import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';
import 'package:mcommerce_app/widgets/stateless/heading_widget.dart';
import 'package:mcommerce_app/widgets/stateless/star_widget.dart';

class ReviewProductWidget extends StatelessWidget {
  const ReviewProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
        padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 30.0),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadingWidget(
              title: "Review",
              child: Text(
                "See All",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: AppFontFamily.fontSecondary,
                  fontWeight: FontWeight.w700,
                  color: AppColors.gray,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Olha Chabanova",
                      style: TextStyle(
                          color: AppColors.dark,
                          fontFamily: AppFontFamily.fontSecondary,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    StarWidget(
                      count: 5,
                      point: 5,
                    )
                  ],
                ),
                Text(
                  "March 01,2023",
                  style: TextStyle(color: AppColors.darkGray, fontSize: 14),
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              child: Text(
                "I got hit by a car and the bike is much better than me, and it took almost all the impact 😁👍, it's a very good bike, it's fast and light, and the quality is noticeable",
                style: TextStyle(
                  color: AppColors.darkGray,
                  fontSize: 16.0,
                  letterSpacing: -0.15,
                  fontFamily: AppFontFamily.fontSecondary,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            // InkWell(
            //   onTap: (() {}),
            //   child: Text(
            //     "Comment",
            //     style: TextStyle(
            //         color: AppColors.dark,
            //         fontSize: 18.0,
            //         letterSpacing: -0.15,
            //         fontFamily: AppFontFamily.fontSecondary,
            //         fontWeight: FontWeight.w500,
            //         decoration: TextDecoration.underline),
            //   ),
            // )
          ],
        ));
  }
}
