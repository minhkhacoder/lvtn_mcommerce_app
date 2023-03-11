import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';

class QuantityWidget extends StatefulWidget {
  @override
  _QuantityWidgetState createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  int quantity = 1;

  void increment() {
    setState(() {
      quantity++;
    });
  }

  void decrement() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            Icons.add_circle_outline,
            color: AppColors.darkGray,
          ),
          onPressed: increment,
        ),
        Text(
          '$quantity',
          style: TextStyle(fontSize: 20, color: AppColors.darkGray),
        ),
        IconButton(
          icon: Icon(
            Icons.remove_circle_outline,
            color: AppColors.darkGray,
          ),
          onPressed: decrement,
        ),
      ],
    );
  }
}
