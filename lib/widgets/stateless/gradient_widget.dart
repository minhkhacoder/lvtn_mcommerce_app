import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';

class GradientWidget extends StatelessWidget {
  final Widget? child;
  const GradientWidget({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.primary,
          AppColors.third,
        ],
        tileMode: TileMode.clamp,
      ).createShader(bounds),
      child: child,
    );
  }
}
