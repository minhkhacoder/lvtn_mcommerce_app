import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/widgets/statefull/bottom_navigation_bar_widget.dart';

class LayoutWidget extends StatefulWidget {
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final Widget? body;
  final double heightSize;

  const LayoutWidget(
      {Key? key,
      this.leading,
      this.title,
      this.actions,
      this.body,
      this.heightSize = 80.0,
      this.bottom})
      : super(key: key);

  @override
  _LayoutWidgetState createState() => _LayoutWidgetState();
}

class _LayoutWidgetState extends State<LayoutWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: widget.leading,
            title: widget.title,
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
                  borderRadius: BorderRadius.all(Radius.circular(14.0))),
            ),
            actions: widget.actions,
            bottom: widget.bottom,
          ),
          preferredSize: Size.fromHeight(widget.heightSize)),
      body: widget.body,
      bottomNavigationBar: BottomNavigationBarWidget(),
      floatingActionButton: Stack(
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: AppColors.primary,
            onPressed: () {
              // mở trang giỏ hàng khi người dùng nhấn vào nút
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
                '0',
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
