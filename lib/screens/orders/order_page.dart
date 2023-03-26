import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mcommerce_app/config/routes/routes.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';
import 'package:mcommerce_app/models/cart_model.dart';
import 'package:mcommerce_app/models/order_model.dart';
import 'package:mcommerce_app/models/payment_model.dart';
import 'package:mcommerce_app/providers/auth_provider.dart';
import 'package:mcommerce_app/providers/cart_provider.dart';
import 'package:mcommerce_app/providers/delivery_provider.dart';
import 'package:mcommerce_app/providers/order_provider.dart';
import 'package:mcommerce_app/providers/payment_provider.dart';

import 'package:mcommerce_app/screens/orders/widgets/payment_modal.dart';
import 'package:mcommerce_app/screens/orders/widgets/success_modal.dart';
import 'package:mcommerce_app/widgets/stateless/button_widget.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  bool _isLoading = true;
  var _delivery;
  var _isDelivery = 0;
  String shipId = "SHIP01";
  String orderAddress =
      "1600 Pennsylvania Avenue NW, Washington, DC 20500, USA";
  int index = 0;
  Data? payment;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (mounted) {
      // kiểm tra xem widget đã bị dispose hay chưa
      payment = Provider.of<PaymentProvider>(context, listen: false)
          .getPaymentAtIndex(index);
    }
  }

  void _showPaymentModal(BuildContext context) async {
    // print(payment?.payName);
    final paymentProvider =
        Provider.of<PaymentProvider>(context, listen: false);
    final result = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return PaymentModal(paymentList: paymentProvider.payments);
      },
    );
    if (result != null) {
      setState(() {
        payment = Provider.of<PaymentProvider>(context, listen: false)
            .getPaymentAtIndex(result);
      });
    }
  }

  void _showSuccessModal(BuildContext context) async {
    final result = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SuccessModal();
      },
    );
    if (result == null) Navigator.pushNamed(context, Routes.homePage);
  }

  void _showCardFormPaymentModal(BuildContext context) async {
    final result = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container();
      },
    );
    // if (result == null) Navigator.pushNamed(context, Routes.homePage);
  }

  void handleCreateOrder() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    List<Cart> carts = cartProvider.carts;
    for (int i = 0; i < carts.length; i++) {
      int? quantity = carts[i].quantity;
      double? price = double.parse(carts[i].price!);
      OrderDetail orderDetail = OrderDetail(
          proId: carts[i].id,
          ordtPrice: quantity! * price,
          ordtQuantity: quantity);
      orderProvider.addOrderDetail(orderDetail);
    }
    String accId = authProvider.user?.accId ?? '';
    String payId = payment?.payId ?? '';
    bool result =
        await orderProvider.createOrder(accId, shipId, payId, orderAddress);
    if (result == true) {
      cartProvider.resetCarts();
      _showSuccessModal(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final deliveryProvider =
        Provider.of<DeliveryProvider>(context, listen: false);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final stringAvatarPay = payment?.payAvatar;
    final stringNamePay = payment?.payName;

    final total = (cartProvider.totalPrice + (_delivery ?? 18.00));
    final formatter = NumberFormat.currency(
      symbol: '\$', // ký hiệu tiền tệ
      decimalDigits: 2, // số chữ số thập phân
    );
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.layoutPage);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.white,
                  size: 24,
                )),
            title: Row(
              children: [
                Text(
                  "Check out",
                  style: TextStyle(
                      color: AppColors.white,
                      fontFamily: AppFontFamily.fontThird,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      letterSpacing: 1),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.primary,
                      AppColors.third,
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(14.0))),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_active_outlined,
                    color: Colors.transparent,
                    size: 24,
                  )),
            ],
          ),
          preferredSize: Size.fromHeight(70.0)),
      body: Container(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 26, bottom: 16),
        child: ListView(children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 24,
                      color: AppColors.primary,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Shipping Address",
                      style: TextStyle(
                          color: AppColors.dark,
                          fontFamily: AppFontFamily.fontSecondary,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                width: MediaQuery.of(context).size.width,
                // height: 92.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(52, 40, 62, 0.08),
                      blurRadius: 12.0,
                      offset: Offset(0.0, 4.0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          authProvider.user?.cusUserName ?? "",
                          style: TextStyle(
                              color: AppColors.dark,
                              fontFamily: AppFontFamily.fontSecondary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            // Xử lý khi người dùng bấm nút
                            _showCardFormPaymentModal(context);
                          },
                          style: ButtonStyle(
                            side: MaterialStateProperty.all<BorderSide>(
                                BorderSide.none),
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    EdgeInsets.zero),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Change',
                                style: TextStyle(
                                    color: AppColors.primary,
                                    fontFamily: AppFontFamily.fontSecondary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: AppColors.primary,
                                size: 24,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Text(
                      orderAddress,
                      style: TextStyle(
                        color: AppColors.darkGray,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5,
                        height:
                            1.26, // set the line height to 19 (16 * 1.26 = 20.16)
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 34.0,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.local_shipping,
                      size: 24,
                      color: AppColors.primary,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Delivery Method",
                      style: TextStyle(
                          color: AppColors.dark,
                          fontFamily: AppFontFamily.fontSecondary,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 1,
                shrinkWrap: true,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 8.0,
                physics: NeverScrollableScrollPhysics(),
                children:
                    deliveryProvider.deliveries.asMap().entries.map((entry) {
                  var index = entry.key;
                  final ship = entry.value;
                  // _delivery = deliveryProvider.deliveries[0].shipFee;
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _delivery = ship.shipFee;
                        _isDelivery = index;
                        shipId = ship.shipId!;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 18.0),
                      width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height,
                      height: 92.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(52, 40, 62, 0.08),
                            blurRadius: 12.0,
                            offset: Offset(0.0, 4.0),
                          ),
                        ],
                        border: index == _isDelivery
                            ? Border.all(color: AppColors.primary, width: 2.0)
                            : null,
                      ),
                      child: Column(
                        children: [
                          Container(
                              width: 71,
                              height: 16,
                              child: CachedNetworkImage(
                                imageUrl: ship.shipAvatar.toString(),
                                fadeInDuration: Duration(milliseconds: 300),
                                fadeOutDuration: Duration(milliseconds: 300),
                                imageBuilder: (context, imageProvider) {
                                  _isLoading = false;
                                  return Container(
                                    width: 71,
                                    height: 16,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.contain)),
                                  );
                                },
                                placeholder: (context, url) {
                                  return _isLoading
                                      ? Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              color: AppColors.primary,
                                            ),
                                          ),
                                        )
                                      : Container();
                                },
                                errorWidget: (context, url, error) => Container(
                                  width: 40,
                                  height: 40,
                                  child: Icon(Icons.error),
                                ),
                              )),
                          SizedBox(
                            height: 12.0,
                          ),
                          Text(
                            formatter.format(ship.shipFee),
                            style: TextStyle(
                                color: AppColors.dark,
                                fontFamily: AppFontFamily.fontSecondary,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Text(
                            ship.shipTime.toString() + " days",
                            style: TextStyle(
                                color: AppColors.darkGray,
                                fontFamily: AppFontFamily.fontSecondary,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 34.0,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.payments,
                          size: 24,
                          color: AppColors.primary,
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Text(
                          "Payment Method",
                          style: TextStyle(
                              color: AppColors.dark,
                              fontFamily: AppFontFamily.fontSecondary,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    margin: EdgeInsets.only(bottom: 40.0),
                    width: MediaQuery.of(context).size.width,
                    // height: 92.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(52, 40, 62, 0.08),
                          blurRadius: 12.0,
                          offset: Offset(0.0, 4.0),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                    width: 52,
                                    height: 52,
                                    child: CachedNetworkImage(
                                      imageUrl: stringAvatarPay.toString(),
                                      fadeInDuration:
                                          Duration(milliseconds: 300),
                                      fadeOutDuration:
                                          Duration(milliseconds: 300),
                                      imageBuilder: (context, imageProvider) {
                                        _isLoading = false;
                                        return Container(
                                          width: 52,
                                          height: 52,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.contain)),
                                        );
                                      },
                                      placeholder: (context, url) {
                                        return _isLoading
                                            ? Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                child: Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: AppColors.primary,
                                                  ),
                                                ),
                                              )
                                            : Container();
                                      },
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        width: 24,
                                        height: 24,
                                        child: Icon(Icons.error),
                                      ),
                                    )),
                                SizedBox(
                                  width: 16.0,
                                ),
                                Text(
                                  stringNamePay.toString(),
                                  style: TextStyle(
                                      color: AppColors.dark,
                                      fontFamily: AppFontFamily.fontSecondary,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            OutlinedButton(
                              onPressed: () {
                                // Xử lý khi người dùng bấm nút
                                _showPaymentModal(context);
                              },
                              style: ButtonStyle(
                                side: MaterialStateProperty.all<BorderSide>(
                                    BorderSide.none),
                                padding: MaterialStateProperty.all<
                                    EdgeInsetsGeometry>(EdgeInsets.zero),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'Change',
                                    style: TextStyle(
                                        color: AppColors.primary,
                                        fontFamily: AppFontFamily.fontSecondary,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    color: AppColors.primary,
                                    size: 24,
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.white,
        shape: AutomaticNotchedShape(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
          ),
          StadiumBorder(side: BorderSide.none),
        ),
        notchMargin: 2.0,
        child: Container(
          height: 210,
          padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5,
                spreadRadius: 2,
                offset: Offset(0, 3),
              ),
            ],
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Items",
                    style: TextStyle(
                        color: AppColors.darkGray,
                        fontFamily: AppFontFamily.fontSecondary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    formatter.format(cartProvider.totalPrice),
                    style: TextStyle(
                        color: AppColors.darkGray,
                        fontFamily: AppFontFamily.fontSecondary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delivery",
                    style: TextStyle(
                        color: AppColors.darkGray,
                        fontFamily: AppFontFamily.fontSecondary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    formatter.format(_delivery ?? 18.00),
                    style: TextStyle(
                        color: AppColors.darkGray,
                        fontFamily: AppFontFamily.fontSecondary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total price",
                    style: TextStyle(
                        color: AppColors.dark,
                        fontFamily: AppFontFamily.fontSecondary,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    formatter.format(total),
                    style: TextStyle(
                        color: AppColors.dark,
                        fontFamily: AppFontFamily.fontSecondary,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
              Container(
                  padding: const EdgeInsets.only(top: 16),
                  width: MediaQuery.of(context).size.width,
                  child: ButtonWidget(
                      label: "Payment", onPressed: handleCreateOrder))
            ],
          ),
        ),
      ),
    );
  }
}
