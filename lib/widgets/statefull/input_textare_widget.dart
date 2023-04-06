import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';

class InputTextareaWidget extends StatefulWidget {
  final String labelText;
  final String placeHolder;
  final int? maxLength;
  final int? maxLines;
  final bool? enabled;
  final bool? autofocus;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  // final TextEditingController? controller;
  final String? initialValue;

  InputTextareaWidget(
      {Key? key,
      required this.labelText,
      required this.placeHolder,
      this.maxLength,
      this.maxLines,
      this.enabled,
      this.autofocus,
      this.keyboardType,
      this.validator,
      this.onSaved,
      // this.controller,
      this.initialValue})
      : super(key: key);

  @override
  _InputTextareaWidgetState createState() => _InputTextareaWidgetState();
}

class _InputTextareaWidgetState extends State<InputTextareaWidget> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      _controller.text = widget.initialValue ?? '';
    } else {
      _controller.text = '';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: TextStyle(
              color: AppColors.dark,
              fontSize: 16,
              fontFamily: AppFontFamily.fontSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: _controller,
            maxLength: widget.maxLength,
            maxLines: widget.maxLines,
            enabled: widget.enabled,
            autofocus: widget.autofocus ?? false,
            keyboardType: widget.keyboardType,
            validator: widget.validator,
            onSaved: widget.onSaved,
            decoration: InputDecoration(
              hintText: widget.placeHolder,
              hintStyle: TextStyle(
                color: AppColors.darkGray,
                fontSize: 16,
                fontFamily: AppFontFamily.fontSecondary,
                fontWeight: FontWeight.w400,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.line),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary),
                borderRadius: BorderRadius.circular(10.0),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.line),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
