import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';

class PriceProductWidget extends StatelessWidget {
  final double originalPrice;
  final double salePrice;
  final bool hasSale;
  final double fontSize;

  const PriceProductWidget({
    Key? key,
    required this.originalPrice,
    this.hasSale = false,
    this.salePrice = 0.0,
    this.fontSize = 18.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (hasSale)
            Text(
              '\$${salePrice.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: fontSize,
                color: AppColors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          hasSale ? SizedBox(width: 5) : SizedBox(width: 0),
          Text(
            '\$${originalPrice.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: fontSize,
              color: hasSale ? AppColors.gray : AppColors.dark,
              decoration: hasSale ? TextDecoration.lineThrough : null,
              fontWeight: hasSale ? FontWeight.normal : FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
