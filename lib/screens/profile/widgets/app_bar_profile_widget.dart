import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';
import 'package:mcommerce_app/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class AppBarProfileWidget extends StatefulWidget {
  const AppBarProfileWidget({Key? key}) : super(key: key);

  @override
  _AppBarProfileWidgetState createState() => _AppBarProfileWidgetState();
}

class _AppBarProfileWidgetState extends State<AppBarProfileWidget> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return PreferredSize(
          child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: Container(
                padding: EdgeInsets.only(left: 16.0, top: 50.0),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Color(0xff8E2DE2),
                        Color(0xff4A00E0),
                      ],
                      tileMode: TileMode.mirror,
                    ),
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(250))),
                child: Stack(
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              border: Border.all(
                                color: Color(0xFFF4F3F4),
                                width: 2.0,
                              ),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: authProvider.user?.cusAvatar == null
                                  ? "https://media.istockphoto.com/id/1223671392/vector/default-profile-picture-avatar-photo-placeholder-vector-illustration.jpg?s=170667a&w=0&k=20&c=m-F9Doa2ecNYEEjeplkFCmZBlc5tm1pl1F7cBCh9ZzM="
                                  : authProvider.user!.cusAvatar.toString(),
                              fadeInDuration: Duration(milliseconds: 300),
                              fadeOutDuration: Duration(milliseconds: 300),
                              imageBuilder: (context, imageProvider) {
                                _isLoading = false;
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100)),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                );
                              },
                              placeholder: (context, url) {
                                return _isLoading
                                    ? Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.primary,
                                        ),
                                      )
                                    : Container();
                              },
                              errorWidget: (context, url, error) => Container(
                                child: Icon(Icons.error),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16.0,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                authProvider.user!.cusUserName.toString(),
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 24,
                                    fontFamily: AppFontFamily.fontSecondary,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                authProvider.user!.accPhone.toString(),
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 16,
                                    fontFamily: AppFontFamily.fontSecondary,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ]),
                    Positioned(
                        bottom: 20,
                        right: 20,
                        child: Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100))),
                          child: IconButton(
                              color: AppColors.primary,
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit_outlined,
                                size: 30,
                              )),
                        ))
                  ],
                ),
              )),
          preferredSize: Size.fromHeight(375.0),
        );
      },
    );
  }
}
