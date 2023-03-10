import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';

import 'package:mcommerce_app/widgets/stateless/gradient_widget.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final int selectedIndex;
  const BottomNavigationBarWidget({Key? key, required this.selectedIndex})
      : super(key: key);

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
              color: _selectedIndex == 0 ? AppColors.primary : AppColors.gray,
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
              color: _selectedIndex == 1 ? AppColors.primary : AppColors.gray,
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
              color: _selectedIndex == 2 ? AppColors.primary : AppColors.gray,
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
              color: _selectedIndex == 3 ? AppColors.primary : AppColors.gray,
              iconSize: 30,
              icon: _selectedIndex == 3
                  ? GradientWidget(child: Icon(Icons.person_outline))
                  : Icon(Icons.person_outlined),
              onPressed: () {
                setState(() {
                  _selectedIndex = 3;
                });
              },
            ),
            SizedBox(
              width: 0.0,
            )
          ],
        ),
      ),
    );
  }
}
