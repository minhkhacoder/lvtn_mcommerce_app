import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';

class InputPassWidget extends StatefulWidget {
  final String labelText;
  final FormFieldValidator<String> validator;
  final FormFieldSetter<String>? onSaved;
  const InputPassWidget({
    Key? key,
    required this.labelText,
    required this.onSaved,
    required this.validator,
  }) : super(key: key);

  @override
  _InputPassWidgetState createState() => _InputPassWidgetState();
}

class _InputPassWidgetState extends State<InputPassWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: TextFormField(
            decoration: InputDecoration(
              labelText: widget.labelText,
              labelStyle: TextStyle(
                color: AppColors.darkGray,
                fontSize: 16,
                fontFamily: AppFontFamily.fontSecondary,
                fontWeight: FontWeight.w600,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.line),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.darkGray,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
            cursorColor: AppColors.primary,
            obscureText: _obscureText,
            validator: widget.validator,
            onSaved: widget.onSaved));
  }
}
