import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mcommerce_app/config/routes/routes.dart';
import 'package:mcommerce_app/providers/auth_provider.dart';
import 'package:mcommerce_app/widgets/statefull/input_phone_widget.dart';
import 'package:mcommerce_app/widgets/stateless/button_widget.dart';
import 'package:mcommerce_app/widgets/statefull/input_widget.dart';
import 'package:mcommerce_app/widgets/statefull/input_pass_widget.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  late String _username;
  late String _phone;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InputWidget(
              labelText: "Enter your username",
              textInputType: TextInputType.text,
              onSaved: (value) {
                _username = value!;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              }),
          InputPhoneWidget(
              labelText: "Enter your phone",
              textInputType: TextInputType.phone,
              onSaved: (value) {
                _phone = value!;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              }),
          InputPassWidget(
              labelText: "Enter your password",
              onSaved: (value) {
                _password = value!;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              }),
          Container(
            padding: const EdgeInsets.only(top: 30, bottom: 10),
            width: MediaQuery.of(context).size.width,
            child: ButtonWidget(
                label: "Signup",
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                  }
                  final authProvider =
                      Provider.of<AuthProvider>(context, listen: false);
                  try {
                    await authProvider.signup(_username, _phone, _password);
                    if (authProvider.isSignup == true) {
                      Fluttertoast.showToast(
                          msg: authProvider.message.toString(),
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: AppColors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      await authProvider.login(_phone, _password);
                    }
                    if (authProvider.isAuthenticated == true) {
                      Fluttertoast.showToast(
                          msg: authProvider.message.toString(),
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 2,
                          backgroundColor: AppColors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      Navigator.pushNamed(context, Routes.homePage);
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
                  } catch (e) {
                    print(e);
                  }
                }),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(fontSize: 18, color: AppColors.darkGray),
                ),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(AppColors.darkGray),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.loginPage);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: AppColors.primary, fontSize: 18),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(AppColors.darkGray),
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.homePage);
              },
              child: Text(
                'Skip',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
