import 'package:flutter/material.dart';
import 'package:mcommerce_app/providers/auth_provider.dart';
import 'package:mcommerce_app/screens/profile/widgets/porfile_order.dart';
import 'package:mcommerce_app/screens/profile/widgets/profile_info.dart';
import 'package:mcommerce_app/screens/profile/widgets/profile_main.dart';
import 'package:mcommerce_app/screens/profile/widgets/profile_payment.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

final List<Widget> _pages = [
  ProfileMain(),
  ProfileInfo(),
  ProfilePayment(),
  ProfileOrder()
];

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authProvider, index) {
      return Container(
          child: IndexedStack(
        index: authProvider.selectIndexProfile,
        children: _pages,
      ));
    });
  }
}
