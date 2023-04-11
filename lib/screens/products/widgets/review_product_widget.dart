import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';
import 'package:mcommerce_app/models/rating_model.dart';
import 'package:mcommerce_app/widgets/stateless/star_widget.dart';

class ReviewProductWidget extends StatelessWidget {
  final List<DataRating> ratings;
  const ReviewProductWidget({Key? key, required this.ratings})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final ratingProvider = Provider.of<RatingProvider>(context, listen: false);
    return ratings.length > 0
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: ratings.length,
            itemBuilder: (context, index) {
              final rating = ratings[index];
              final dateTime = DateTime.parse(rating.createdAt.toString());
              final format = DateFormat('MMMM, dd, yyyy');
              return Container(
                // padding: EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              rating.customer.toString(),
                              style: TextStyle(
                                color: AppColors.dark,
                                fontFamily: AppFontFamily.fontSecondary,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            StarWidget(
                              count: rating.point,
                              point: 5,
                            )
                          ],
                        ),
                        Text(
                          format.format(dateTime),
                          style: TextStyle(
                            color: AppColors.darkGray,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        rating.desc.toString(),
                        style: TextStyle(
                          color: AppColors.darkGray,
                          fontSize: 16.0,
                          letterSpacing: -0.15,
                          fontFamily: AppFontFamily.fontSecondary,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Divider()
                  ],
                ),
              );
            },
          )
        : Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              "Product has not been rated yet!",
              style: TextStyle(
                color: AppColors.darkGray,
                fontSize: 16.0,
                letterSpacing: -0.15,
                fontFamily: AppFontFamily.fontSecondary,
                fontWeight: FontWeight.w400,
              ),
            ),
          );
  }
}
