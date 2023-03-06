import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';

class InputWidget extends StatefulWidget {
  final String labelText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final bool obscureText;
  final FormFieldValidator<String> validator;
  final FormFieldSetter<String>? onSaved;
  const InputWidget({
    Key? key,
    required this.labelText,
    required this.onSaved,
    required this.validator,
    this.textInputType = TextInputType.text,
    this.suffixIcon,
    this.obscureText = false,
  }) : super(key: key);

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // get controller => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: this._controller,
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
          suffixIcon: widget.suffixIcon,
        ),
        cursorColor: AppColors.primary,
        keyboardType: widget.textInputType,
        validator: widget.validator,
        obscureText: widget.obscureText,
        onSaved: widget.onSaved,
      ),
    );
  }
}
