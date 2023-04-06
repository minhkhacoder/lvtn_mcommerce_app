import 'package:flutter/cupertino.dart';
import 'package:mcommerce_app/providers/auth_provider.dart';
import 'package:mcommerce_app/screens/profile/widgets/app_bar_address_profile.dart';
import 'package:mcommerce_app/screens/profile/widgets/app_bar_info_profile.dart';
import 'package:mcommerce_app/screens/profile/widgets/app_bar_profile_widget.dart';
import 'package:provider/provider.dart';

class ListAppBarProfile extends StatefulWidget {
  const ListAppBarProfile({Key? key}) : super(key: key);

  @override
  _ListAppBarProfileState createState() => _ListAppBarProfileState();
}

final List<Widget> _pages = [
  AppBarProfileWidget(),
  AppBarInfoProfile(),
  AppBarAddressProfile()
];

class _ListAppBarProfileState extends State<ListAppBarProfile> {
  int _selectIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final authProvider = Provider.of<AuthProvider>(context, listen: true);
    setState(() {
      _selectIndex = authProvider.selectIndexProfile;
      print(_selectIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: IndexedStack(
      index: _selectIndex,
      children: _pages,
    ));
  }
}
