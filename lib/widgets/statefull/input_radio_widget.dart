import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';

class InputRadioWidget extends StatefulWidget {
  final String labelText;
  final List<String> options;
  final ValueChanged<String>? onValueChanged;
  final String? initialValue;

  const InputRadioWidget({
    Key? key,
    required this.labelText,
    required this.options,
    this.onValueChanged,
    this.initialValue, // thêm initialValue vào đây
  }) : super(key: key);

  @override
  _InputRadioWidgetState createState() => _InputRadioWidgetState();
}

class _InputRadioWidgetState extends State<InputRadioWidget> {
  String _selectedOption = '';

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      // kiểm tra giá trị ban đầu đã được đặt chưa
      _selectedOption = widget.initialValue!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
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
          SizedBox(height: 8),
          Row(
            children: widget.options.map((option) {
              return Row(
                children: [
                  Radio<String>(
                    activeColor: AppColors.primary,
                    value: option,
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                        if (widget.onValueChanged != null) {
                          widget.onValueChanged!(_selectedOption);
                        }
                      });
                    },
                  ),
                  Text(option,
                      style: TextStyle(
                        color: AppColors.darkGray,
                        fontSize: 12,
                        fontFamily: AppFontFamily.fontSecondary,
                        fontWeight: FontWeight.w600,
                      )),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
