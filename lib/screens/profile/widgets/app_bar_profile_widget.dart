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
  String _avatar = "";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final authProvider = Provider.of<AuthProvider>(context, listen: true);
    if (authProvider.user != null) {
      setState(() {
        _avatar = authProvider.user!.cusAvatar?.toString() ?? "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: true);
    return AppBar(
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
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(250),
            ),
          ),
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 35,
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.grey[300],
                      child: ClipOval(
                        child: SizedBox(
                          width: 70,
                          height: 70,
                          child: Stack(
                            children: [
                              Center(
                                child: _avatar.isEmpty
                                    ? Icon(
                                        Icons.person,
                                        size: 40,
                                        color: AppColors.primary,
                                      )
                                    : null,
                              ),
                              Center(
                                child: _avatar.isNotEmpty
                                    ? Image.network(
                                        _avatar,
                                        fit: BoxFit.contain,
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return CircularProgressIndicator(
                                            color: AppColors.primary,
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded
                                                        .toDouble() /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                        .toDouble()
                                                : null,
                                          );
                                        },
                                      )
                                    : null,
                              ),
                            ],
                          ),
                        ),
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
                        authProvider.user?.cusUserName ?? "",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 24,
                          fontFamily: AppFontFamily.fontSecondary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        authProvider.user?.accPhone ?? "",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontFamily: AppFontFamily.fontSecondary,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                    width: 48.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    child: IconButton(
                        color: AppColors.primary,
                        onPressed: () {
                          authProvider.loadUserData();
                          authProvider.changePageIndexProfile(1, 60.0);
                        },
                        icon: Icon(
                          Icons.edit_outlined,
                          size: 30,
                        )),
                  ))
            ],
          ),
        ));
  }
}
