import 'package:flutter/material.dart';

class GradientTtb extends StatelessWidget {
  const GradientTtb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
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
        ),
      ),
    );
  }
}
