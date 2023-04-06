import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';
import 'package:mcommerce_app/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class AppBarAddressProfile extends StatelessWidget {
  const AppBarAddressProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            final authProvider =
                Provider.of<AuthProvider>(context, listen: false);
            authProvider.changePageIndexProfile(0, 110.0);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.white,
            size: 24,
          )),
      title: Row(
        children: [
          Text(
            "Shipping Addresses",
            style: TextStyle(
                color: AppColors.white,
                fontFamily: AppFontFamily.fontThird,
                fontWeight: FontWeight.w700,
                fontSize: 18,
                letterSpacing: 1),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primary,
              AppColors.third,
            ],
          ),
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_active_outlined,
              color: Colors.transparent,
              size: 24,
            )),
      ],
    );
  }
}
