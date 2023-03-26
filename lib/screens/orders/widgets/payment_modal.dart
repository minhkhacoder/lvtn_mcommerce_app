import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';
import 'package:mcommerce_app/models/payment_model.dart';

class PaymentModal extends StatefulWidget {
  final List<Data> paymentList;

  PaymentModal({required this.paymentList});

  @override
  _PaymentModalState createState() => _PaymentModalState();
}

class _PaymentModalState extends State<PaymentModal> {
  late List<Data> _paymentList;
  int _selectedPaymentIndex = 0;

  @override
  void initState() {
    super.initState();
    _paymentList = widget.paymentList;
  }

  void _onPaymentSelected(int index) {
    Navigator.pop(context, index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _paymentList.length,
        itemBuilder: (BuildContext context, int index) {
          final payment = _paymentList[index];
          return InkWell(
            onTap: () {
              setState(() {
                _selectedPaymentIndex = index;
              });
              _onPaymentSelected(_selectedPaymentIndex);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: index == _paymentList.length - 1
                        ? Colors.transparent
                        : Colors.grey.withOpacity(0.5),
                    width: 0.5,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      payment.payName.toString(),
                      style: TextStyle(
                        color: AppColors.dark,
                        fontFamily: AppFontFamily.fontSecondary,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    child: CachedNetworkImage(
                      imageUrl: payment.payAvatar.toString(),
                      fadeInDuration: Duration(milliseconds: 300),
                      fadeOutDuration: Duration(milliseconds: 300),
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.contain,
                            ),
                          ),
                        );
                      },
                      placeholder: (context, url) {
                        return Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          ),
                        );
                      },
                      errorWidget: (context, url, error) => Container(
                        width: 40,
                        height: 40,
                        child: Icon(Icons.error),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
