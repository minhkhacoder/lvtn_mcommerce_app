import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/routes/routes.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/providers/auth_provider.dart';
import 'package:mcommerce_app/providers/cart_provider.dart';
import 'package:mcommerce_app/screens/categories/category_page.dart';
import 'package:mcommerce_app/screens/categories/widgets/app_bar_category_widget.dart';
import 'package:mcommerce_app/screens/home/widgets/app_bar_home_widget.dart';
import 'package:mcommerce_app/screens/home/widgets/home_body_widget.dart';
import 'package:mcommerce_app/screens/profile/profile_page.dart';
import 'package:mcommerce_app/screens/profile/widgets/list_app_bar_profile.dart';

import 'package:mcommerce_app/widgets/stateless/gradient_widget.dart';
import 'package:provider/provider.dart';

class LayoutWidget extends StatefulWidget {
  final Widget? body;

  final Widget? appBar;
  final int selectedIndex;

  const LayoutWidget({
    Key? key,
    this.body,
    this.appBar,
    this.selectedIndex = 0,
  }) : super(key: key);

  @override
  _LayoutWidgetState createState() => _LayoutWidgetState();
}

final List<Widget> _pages = [
  HomeBodyWidget(),
  CategoryPage(),
  CategoryPage(),
  ProfilePage()
];
final List<Widget> _appBar = [
  AppBarHomeWidget(),
  AppBarCategoryWidget(),
  AppBarCategoryWidget(),
  ListAppBarProfile()
];

class _LayoutWidgetState extends State<LayoutWidget> {
  late int _selectedIndex;
  double _sizeAppBar = 110.0;
  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedIndex = widget.selectedIndex;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (mounted) {
      // kiểm tra xem widget đã bị dispose hay chưa
      final authProvider = Provider.of<AuthProvider>(context, listen: true);
      _sizeAppBar = authProvider.sizeHeightAppBar;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
        backgroundColor: AppColors.bg,
        appBar: PreferredSize(
            child: IndexedStack(
              index: _selectedIndex,
              children: _appBar,
            ),
            preferredSize: Size.fromHeight(_sizeAppBar)),
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomAppBar(
          color: AppColors.white,
          shape: AutomaticNotchedShape(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
            ),
            StadiumBorder(side: BorderSide.none),
          ),
          notchMargin: 2.0,
          child: Container(
            height: 68,
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
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  color:
                      _selectedIndex == 0 ? AppColors.primary : AppColors.gray,
                  iconSize: 30,
                  icon: _selectedIndex == 0
                      ? GradientWidget(child: Icon(Icons.home))
                      : Icon(Icons.home),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                ),
                IconButton(
                  color:
                      _selectedIndex == 1 ? AppColors.primary : AppColors.gray,
                  iconSize: 30,
                  icon: _selectedIndex == 1
                      ? GradientWidget(child: Icon(Icons.widgets_outlined))
                      : Icon(Icons.widgets_outlined),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                ),
                IconButton(
                  color:
                      _selectedIndex == 2 ? AppColors.primary : AppColors.gray,
                  iconSize: 30,
                  icon: _selectedIndex == 2
                      ? GradientWidget(child: Icon(Icons.favorite))
                      : Icon(Icons.favorite),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                ),
                IconButton(
                  color:
                      _selectedIndex == 3 ? AppColors.primary : AppColors.gray,
                  iconSize: 30,
                  icon: _selectedIndex == 3
                      ? GradientWidget(child: Icon(Icons.person_outline))
                      : Icon(Icons.person_outlined),
                  onPressed: () {
                    final authProvider =
                        Provider.of<AuthProvider>(context, listen: false);
                    if (authProvider.isAuthenticated == true) {
                      setState(() {
                        _selectedIndex = 3;
                      });
                    } else {
                      Navigator.pushNamed(context, Routes.loginPage);
                    }
                  },
                ),
                SizedBox(
                  width: 0.0,
                )
              ],
            ),
          ),
        ),
        floatingActionButton: Stack(
          children: <Widget>[
            FloatingActionButton(
              backgroundColor: AppColors.primary,
              onPressed: () {
                Navigator.pushNamed(context, Routes.cartPage);
              },
              child: const Icon(
                Icons.shopping_cart,
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: AppColors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                constraints: BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: Text(
                  authProvider.isAuthenticated
                      ? cartProvider.carts.length.toString()
                      : "0",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked);
  }
}
