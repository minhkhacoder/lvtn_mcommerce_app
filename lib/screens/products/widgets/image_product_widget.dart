import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';

class ImageProductWidget extends StatelessWidget {
  final String image_url;
  const ImageProductWidget({Key? key, required this.image_url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      padding: EdgeInsets.all(10.0),
      child: Stack(children: [
        Image.network(
          image_url,
          width: 163,
          height: 163,
          fit: BoxFit.contain,
          alignment: Alignment.center,
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              // padding: EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(100.0))),
              child: IconButton(
                iconSize: 24,
                icon: Icon(Icons.favorite_outline, color: AppColors.primary),
                onPressed: () {},
              ),
            ))
      ]),
    );
  }
}
