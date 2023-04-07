import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/routes/routes.dart';
import 'package:mcommerce_app/providers/auth_provider.dart';
import 'package:mcommerce_app/screens/orders/order_page.dart';
import 'package:mcommerce_app/widgets/statefull/input_textare_widget.dart';
import 'package:mcommerce_app/widgets/stateless/button_widget.dart';
import 'package:provider/provider.dart';

class PaymentCardModal extends StatefulWidget {
  final String address;
  const PaymentCardModal({Key? key, required this.address}) : super(key: key);

  @override
  _PaymentCardModalState createState() => _PaymentCardModalState();
}

class _PaymentCardModalState extends State<PaymentCardModal> {
  final _formKey = GlobalKey<FormState>();
  String? _address;
  String? _id;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (mounted) {
      // kiểm tra xem widget đã bị dispose hay chưa
      final authProvider = Provider.of<AuthProvider>(context, listen: true);
      setState(() {
        _id = authProvider.user!.cusId;
        _address = authProvider.user!.cusAddress;
      });
    }
  }

  String _updateAddress(String newAddress) {
    // Cập nhật địa chỉ mới ở đây
    return newAddress;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              InputTextareaWidget(
                labelText: 'Address',
                placeHolder: 'Enter your address',
                maxLines: 5,
                onSaved: (value) {
                  setState(() {
                    _address = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your address';
                  }
                  return null;
                },
                initialValue: widget.address,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 16.0),
                child: ButtonWidget(
                  label:
                      widget.address == "" ? "Add Address" : "Update Address",
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                    }
                    final authProvider =
                        Provider.of<AuthProvider>(context, listen: false);
                    await authProvider.updateAddressAccount(
                        _id.toString(), _address);

                    Navigator.pop(context, _updateAddress(_address!));
                  },
                ),
              )
            ],
          )),
    );
  }
}
