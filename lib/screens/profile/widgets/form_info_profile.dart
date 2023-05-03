import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/providers/auth_provider.dart';
import 'package:mcommerce_app/widgets/statefull/image_upload_widget.dart';
import 'package:mcommerce_app/widgets/statefull/input_radio_widget.dart';
import 'package:mcommerce_app/widgets/statefull/input_textare_widget.dart';
import 'package:mcommerce_app/widgets/stateless/button_widget.dart';
import 'package:mcommerce_app/widgets/statefull/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormInfoProfile extends StatefulWidget {
  const FormInfoProfile({Key? key}) : super(key: key);

  @override
  _FormInfoProfileState createState() => _FormInfoProfileState();
}

class _FormInfoProfileState extends State<FormInfoProfile> {
  final _formKey = GlobalKey<FormState>();
  String _username = "";
  String _email = "";
  String _gender = "";
  String _address = "";

  File? _selectedImageFile;

  void _onImageSelected(File? imageFile) {
    setState(() {
      _selectedImageFile = imageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: true);
    if (authProvider.user != null) {
      _username = authProvider.user!.cusUserName.toString() == "null"
          ? ""
          : authProvider.user!.cusUserName.toString();
      _email = authProvider.user!.cusEmail.toString() == "null"
          ? ""
          : authProvider.user!.cusEmail.toString();
      _gender = authProvider.user!.cusGender.toString() == "null"
          ? ""
          : authProvider.user!.cusGender.toString();

      _address = authProvider.user!.cusAddress.toString() == "null"
          ? ""
          : authProvider.user!.cusAddress.toString();
    }

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ImageUploadWidget(
            onImageSelected: _onImageSelected,
          ),
          InputWidget(
            labelText: "Enter your username",
            textInputType: TextInputType.text,
            onSaved: (value) {
              setState(() {
                _username = value!;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter your username';
              }
              return null;
            },
            initialValue: _username,
          ),
          InputWidget(
            labelText: "Enter your email",
            textInputType: TextInputType.text,
            onSaved: (value) {
              setState(() {
                _email = value!;
              });
            },
            validator: (value) {
              return null;
            },
            initialValue: _email,
          ),
          InputRadioWidget(
            labelText: 'Gender',
            options: ['Male', 'Female', 'Other'],
            onValueChanged: (selectedOption) {
              _gender = selectedOption;
            },
            initialValue: _gender,
          ),
          InputTextareaWidget(
            labelText: 'Address',
            placeHolder: 'Enter your address',
            maxLines: 5,
            onSaved: (value) {
              setState(() {
                _address = value!;
              });
            },
            initialValue: _address,
          ),
          Container(
            padding: const EdgeInsets.only(top: 30, bottom: 10),
            width: MediaQuery.of(context).size.width,
            child: ButtonWidget(
                label: "Update",
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                  }
                  String? id = authProvider.user!.cusId;
                  await authProvider.updateInfoAccount(id!, _username, _email,
                      _gender, _address, _selectedImageFile);

                  if (authProvider.isUpdate == true) {
                    Fluttertoast.showToast(
                        msg: authProvider.message.toString(),
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 2,
                        backgroundColor: AppColors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    _formKey.currentState?.reset();
                    await authProvider.loadUserData();
                    authProvider.changePageIndexProfile(0, 110.0);
                  } else {
                    Fluttertoast.showToast(
                        msg: authProvider.message.toString(),
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 2,
                        backgroundColor: AppColors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                }),
          ),
        ],
      ),
    );
  }
}
