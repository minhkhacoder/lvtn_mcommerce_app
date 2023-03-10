import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';
import 'package:mcommerce_app/widgets/stateless/heading_widget.dart';

class ProductDescriptionWidget extends StatefulWidget {
  final String description;

  ProductDescriptionWidget({required this.description});

  @override
  _ProductDescriptionWidgetState createState() =>
      _ProductDescriptionWidgetState();
}

class _ProductDescriptionWidgetState extends State<ProductDescriptionWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadingWidget(title: "Product description"),
        Text(
          widget.description,
          maxLines: _isExpanded ? 20 : 4,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColors.darkGray,
            fontSize: 16.0,
            letterSpacing: -0.15,
            fontFamily: AppFontFamily.fontSecondary,
            fontWeight: FontWeight.w400,
          ),
        ),
        _isExpanded
            ? Center(
                child: IconButton(
                    onPressed: () => setState(() => _isExpanded = false),
                    icon: Icon(
                      Icons.keyboard_arrow_up,
                      size: 30,
                      color: AppColors.darkGray,
                    )),
              )
            : Center(
                child: IconButton(
                    onPressed: () => setState(() => _isExpanded = true),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 30,
                      color: AppColors.darkGray,
                    )),
              )
      ],
    );
  }
}
