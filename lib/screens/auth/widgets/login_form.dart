import 'dart:math';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:mcommerce_app/config/routes/routes.dart';
import 'package:mcommerce_app/providers/auth_provider.dart';
import 'package:mcommerce_app/widgets/statefull/input_phone_widget.dart';
import 'package:mcommerce_app/widgets/stateless/button_widget.dart';
import 'package:mcommerce_app/widgets/statefull/input_pass_widget.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late String _phone;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(AppColors.darkGray),
              ),
              onPressed: () {},
              child: Text('Forgot Password?'),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 30, bottom: 10),
            width: MediaQuery.of(context).size.width,
            child: ButtonWidget(
                label: "Login",
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                  }
                  final authProvider =
                      Provider.of<AuthProvider>(context, listen: false);
                  try {
                    await authProvider.login(_phone, _password);
                    if (authProvider.isAuthenticated == true) {
                      final snackBar = SnackBar(
                        backgroundColor: Colors.transparent,
                        behavior: SnackBarBehavior.floating,
                        elevation: 0,
                        content: Stack(
                          children: [
                            Container(
                                padding: EdgeInsets.all(16.0),
                                height: 90.0,
                                decoration: BoxDecoration(
                                    color: AppColors.green,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.0))),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 48,
                                    ),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Success!",
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: AppColors.white),
                                        ),
                                        Text(
                                          'You logged in successfully!',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: AppColors.white),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    )),
                                  ],
                                )),
                            Positioned(
                              bottom: 0,
                              child: SvgPicture.asset(
                                'assets/icons/bubbles.svg',
                                height: 48,
                                width: 48,
                                color: AppColors.white,
                              ),
                            )
                          ],
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.pushNamed(context, Routes.homePage);
                    } else {
                      final snackBar = SnackBar(
                        backgroundColor: Colors.transparent,
                        behavior: SnackBarBehavior.floating,
                        elevation: 0,
                        content: Stack(
                          children: [
                            Container(
                                padding: EdgeInsets.all(16.0),
                                height: 90.0,
                                decoration: BoxDecoration(
                                    color: AppColors.red,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.0))),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 48,
                                    ),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Error!",
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: AppColors.white),
                                        ),
                                        Text(
                                          'You login failed!',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: AppColors.white),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    )),
                                  ],
                                )),
                            Positioned(
                              bottom: 0,
                              child: SvgPicture.asset(
                                'assets/icons/bubbles.svg',
                                height: 48,
                                width: 48,
                                color: AppColors.white,
                              ),
                            )
                          ],
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                  "Don’t you have an account?",
                  style: TextStyle(fontSize: 18, color: AppColors.darkGray),
                ),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(AppColors.darkGray),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.signUpPage);
                  },
                  child: Text(
                    'Signup',
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
              onPressed: () async {
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
