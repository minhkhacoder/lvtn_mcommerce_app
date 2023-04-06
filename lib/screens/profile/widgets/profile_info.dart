import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/screens/profile/widgets/form_info_profile.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            padding: EdgeInsets.only(top: 24, left: 24, right: 24),
            color: AppColors.white,
            // decoration: BoxDecoration(color: AppColors.white),
            child: FormInfoProfile())
      ],
    );
  }
}
