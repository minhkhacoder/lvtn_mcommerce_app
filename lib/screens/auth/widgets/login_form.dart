import 'package:fluttertoast/fluttertoast.dart';
import 'package:mcommerce_app/config/routes/routes.dart';
import 'package:mcommerce_app/providers/auth_provider.dart';
import 'package:mcommerce_app/providers/cart_provider.dart';
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
                  final cartProvider =
                      Provider.of<CartProvider>(context, listen: false);
                  try {
                    await authProvider.login(_phone, _password);
                    if (authProvider.isAuthenticated == true) {
                      await cartProvider.loadCart();
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
