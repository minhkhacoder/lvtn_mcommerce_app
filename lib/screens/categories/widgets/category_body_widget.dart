import 'package:flutter/material.dart';

class CategoryBodyWidget extends StatefulWidget {
  const CategoryBodyWidget({Key? key}) : super(key: key);

  @override
  _CategoryBodyWidgetState createState() => _CategoryBodyWidgetState();
}

class _CategoryBodyWidgetState extends State<CategoryBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Categories"),
    );
  }
}
