import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';

class StarWidget extends StatelessWidget {
  final double size;

  const StarWidget({Key? key, this.size = 24.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: AppColors.orange,
            size: size,
          ),
          Icon(
            Icons.star,
            color: AppColors.orange,
            size: size,
          ),
          Icon(
            Icons.star,
            color: AppColors.orange,
            size: size,
          ),
          Icon(
            Icons.star,
            color: AppColors.orange,
            size: size,
          ),
          Icon(
            Icons.star,
            color: AppColors.orange,
            size: size,
          )
        ],
      ),
    );
  }
}
