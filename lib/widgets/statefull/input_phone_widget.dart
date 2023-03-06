import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';

class InputPhoneWidget extends StatefulWidget {
  final String labelText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final FormFieldValidator<String> validator;
  final FormFieldSetter<String>? onSaved;
  const InputPhoneWidget({
    Key? key,
    required this.labelText,
    required this.onSaved,
    required this.validator,
    this.textInputType = TextInputType.text,
    this.suffixIcon,
  }) : super(key: key);

  @override
  _InputPhoneWidgetState createState() => _InputPhoneWidgetState();
}

class _InputPhoneWidgetState extends State<InputPhoneWidget> {
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
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        validator: widget.validator,
        onSaved: widget.onSaved,
      ),
    );
  }
}
