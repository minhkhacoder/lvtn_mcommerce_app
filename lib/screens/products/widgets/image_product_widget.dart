import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';

class ImageProductWidget extends StatefulWidget {
  final String image_url;

  const ImageProductWidget({Key? key, required this.image_url})
      : super(key: key);

  @override
  _ImageProductWidgetState createState() => _ImageProductWidgetState();
}

class _ImageProductWidgetState extends State<ImageProductWidget> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  void _loadImage() async {
    final image = NetworkImage(widget.image_url);
    await image.evict();
    await precacheImage(image, context);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      padding: EdgeInsets.all(10.0),
      child: Stack(
        children: [
          _isLoading
              ? Container(
                  width: 163,
                  height: 163,
                  child: Center(
                    child: Container(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                )
              : Image.network(
                  widget.image_url,
                  width: 163,
                  height: 163,
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
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
                borderRadius: BorderRadius.all(Radius.circular(100.0)),
              ),
              child: IconButton(
                iconSize: 24,
                icon: Icon(Icons.favorite_outline, color: AppColors.primary),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
