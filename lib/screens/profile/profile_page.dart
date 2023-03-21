import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/routes/routes.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/providers/auth_provider.dart';
import 'package:mcommerce_app/screens/profile/widgets/profile_item_widget.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
          padding: EdgeInsets.only(top: 24, left: 16, right: 16),
          children: [
            ProfileItemWidget(
              icon: Icon(
                Icons.location_on_outlined,
                size: 24,
                color: AppColors.primary,
              ),
              title: 'Shipping Addresses',
            ),
            SizedBox(
              height: 16,
            ),
            ProfileItemWidget(
              icon: Icon(
                Icons.credit_card_outlined,
                size: 24,
                color: AppColors.primary,
              ),
              title: 'Payment Methods',
            ),
            SizedBox(
              height: 16,
            ),
            ProfileItemWidget(
              icon: Icon(
                Icons.assignment_outlined,
                size: 24,
                color: AppColors.primary,
              ),
              title: 'Orders',
            ),
            SizedBox(
              height: 16,
            ),
            ProfileItemWidget(
              icon: Icon(
                Icons.favorite_border,
                size: 24,
                color: AppColors.primary,
              ),
              title: 'Favorite',
            ),
            SizedBox(
              height: 16,
            ),
            ProfileItemWidget(
              icon: Icon(
                Icons.settings_outlined,
                size: 24,
                color: AppColors.primary,
              ),
              title: 'Settings',
            ),
            SizedBox(
              height: 16,
            ),
            ProfileItemWidget(
              onTap: () async {
                final authProvider =
                    Provider.of<AuthProvider>(context, listen: false);
                await authProvider.logout();
                Navigator.pushNamed(context, Routes.homePage);
              },
              icon: Icon(
                Icons.logout_outlined,
                size: 24,
                color: AppColors.primary,
              ),
              title: 'Log Out',
            )
          ]),
    );
  }
}
