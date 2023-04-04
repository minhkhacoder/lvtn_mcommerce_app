import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';
import 'package:mcommerce_app/screens/auth/widgets/info_param_widget.dart';

class InfoStoreWidget extends StatefulWidget {
  final Map<String, dynamic> seller;
  const InfoStoreWidget({Key? key, required this.seller}) : super(key: key);

  @override
  _InfoStoreWidgetState createState() => _InfoStoreWidgetState();
}

class _InfoStoreWidgetState extends State<InfoStoreWidget> {
  bool _isLoading = true;
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
                  Container(
                    width: 60,
                    height: 60,
                    child: CachedNetworkImage(
                      imageUrl: widget.seller['seller_avatar'],
                      fadeInDuration: Duration(milliseconds: 300),
                      fadeOutDuration: Duration(milliseconds: 300),
                      imageBuilder: (context, imageProvider) {
                        _isLoading = false;
                        return Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      placeholder: (context, url) {
                        return _isLoading
                            ? Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.primary,
                                  ),
                                ),
                              )
                            : Container();
                      },
                      errorWidget: (context, url, error) => Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.error),
                      ),
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
                        widget.seller["seller_name"].toString(),
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
                            Icons.check_circle,
                            color: AppColors.green,
                            size: 18,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "favorite",
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
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     InfoParamWidget(number: "72", text: "products"),
          //     InfoParamWidget(number: "4.9", text: "reviews"),
          //     InfoParamWidget(number: "99%", text: "response Chat")
          //   ],
          // ),
        ],
      ),
    );
  }
}
