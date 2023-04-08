import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';

class ImageProductWidget extends StatefulWidget {
  final String image_url;
  final bool isHeart;

  const ImageProductWidget(
      {Key? key, required this.image_url, this.isHeart = true})
      : super(key: key);

  @override
  _ImageProductWidgetState createState() => _ImageProductWidgetState();
}

class _ImageProductWidgetState extends State<ImageProductWidget> {
  bool _isLoading = true;

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
          Container(
            width: 163,
            height: 163,
            child: CachedNetworkImage(
              imageUrl: widget.image_url,
              fadeInDuration: Duration(milliseconds: 300),
              fadeOutDuration: Duration(milliseconds: 300),
              imageBuilder: (context, imageProvider) {
                _isLoading = false;
                return Container(
                  width: 163,
                  height: 163,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.contain)),
                );
              },
              placeholder: (context, url) {
                return _isLoading
                    ? Container(
                        width: 163,
                        height: 163,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        ),
                      )
                    : Container();
              },
              errorWidget: (context, url, error) => Container(
                width: 163,
                height: 163,
                child: Icon(Icons.error),
              ),
            ),
          ),
          widget.isHeart
              ? Positioned(
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
                      icon: Icon(Icons.favorite_outline,
                          color: AppColors.primary),
                      onPressed: () {},
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
