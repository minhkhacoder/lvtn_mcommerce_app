// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:mcommerce_app/config/themes/app_colors.dart';

class StarWidget extends StatelessWidget {
  final double size;
  final int? count;
  final int? point;

  const StarWidget({
    Key? key,
    this.size = 24.0,
    required this.count,
    required this.point,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: point! > 0
          ? Row(
              children: List.generate(5, (index) {
                final color = index < count! ? AppColors.orange : Colors.grey;
                return Icon(
                  Icons.star,
                  color: color,
                  size: size,
                );
              }),
            )
          : Align(
              alignment: Alignment.centerLeft,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primary, AppColors.third],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  child: Text(
                    'New',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
