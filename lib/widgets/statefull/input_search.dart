import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';

class InputSearch extends StatefulWidget {
  final String hintsText;
  final FormFieldSetter<String>? onSaved;
  const InputSearch({Key? key, required this.hintsText, this.onSaved})
      : super(key: key);

  @override
  _InputSearchState createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  final _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 44,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(Radius.circular(100)),
              boxShadow: [
                BoxShadow(
                    color: AppColors.dark.withOpacity(0.2),
                    blurRadius: 7,
                    offset: Offset(0, 1))
              ]),
          child: TextFormField(
            controller: this._controller,
            decoration: InputDecoration(
                hintText: widget.hintsText,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.darkGray,
                ),
                prefixStyle: TextStyle(color: AppColors.darkGray)),
            cursorColor: AppColors.dark,
            onSaved: widget.onSaved,
          ),
        ),
      ),
    );
  }
}
