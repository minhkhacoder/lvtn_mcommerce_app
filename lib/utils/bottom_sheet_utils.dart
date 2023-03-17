import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';

void showBottomSheet(BuildContext context, Widget child) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24.0),
        topRight: Radius.circular(24.0),
      ),
    ),
    context: context,
    builder: (BuildContext context) {
      return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        child: Container(
            constraints:
                BoxConstraints(maxHeight: double.infinity, minHeight: 200.0),
            child: Column(
              children: [
                Center(
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 12.0),
                        width: 80.0,
                        height: 5.0,
                        decoration: BoxDecoration(
                            color: AppColors.darkGray,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100.0))),
                      )),
                ),
                child
              ],
            )),
      );
    },
  );
}
