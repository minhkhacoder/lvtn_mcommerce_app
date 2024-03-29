import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mcommerce_app/config/themes/app_colors.dart';
import 'package:mcommerce_app/config/themes/app_font_family.dart';
import 'package:mcommerce_app/providers/order_detail_provider.dart';
import 'package:mcommerce_app/screens/products/widgets/image_product_widget.dart';
import 'package:mcommerce_app/utils/get_status_order.dart';
import 'package:provider/provider.dart';

class ProfileOrder extends StatefulWidget {
  const ProfileOrder({Key? key}) : super(key: key);

  @override
  _ProfileOrderState createState() => _ProfileOrderState();
}

class _ProfileOrderState extends State<ProfileOrder> {
  // List<DataOrderDetail> _orders = [];
  bool _isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Consumer<OrderDetailProvider>(
      builder: (context, orderDetailProvider, child) {
        final _orders = orderDetailProvider.orders;
        return ListView.builder(
          itemCount: _orders.length,
          itemBuilder: (context, index) {
            final details = _orders[index].details;
            final dateTime =
                DateTime.parse(_orders[index].createdAt.toString());
            final format = DateFormat('MMMM, dd, yyyy');
            final idOrder = _orders[index].orId.toString();
            final statusOrder = _orders[index].status.toString();
            Map<String, List<Map<String, dynamic>>> storeMap = {};

            for (var detail in details!) {
              String sellerName = detail.products!.seller!.sellerName!;
              if (storeMap.containsKey(sellerName)) {
                storeMap[sellerName]!.add(detail.toJson());
              } else {
                storeMap[sellerName] = [detail.toJson()];
              }
            }

            List<Widget> storeWidgets = [];
            storeMap.forEach((sellerName, details) {
              storeWidgets.add(
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        color: AppColors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.add_business,
                                  color: AppColors.primary,
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  sellerName,
                                  style: TextStyle(
                                      color: AppColors.dark,
                                      fontFamily: AppFontFamily.fontSecondary,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            Text(format.format(dateTime),
                                style: TextStyle(
                                    color: AppColors.darkGray,
                                    fontFamily: AppFontFamily.fontSecondary,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: details.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 16.0, left: 16.0, right: 16.0),
                            child: Column(
                              children: [
                                Container(
                                  color: AppColors.white,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: 100.0,
                                          height: 100.0,
                                          padding: EdgeInsets.zero,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: AppColors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0)),
                                            ),
                                            padding: EdgeInsets.all(10.0),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  width: 163,
                                                  height: 163,
                                                  child: CachedNetworkImage(
                                                    imageUrl: details[index]
                                                        ['products']['image'],
                                                    fadeInDuration: Duration(
                                                        milliseconds: 300),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 300),
                                                    imageBuilder: (context,
                                                        imageProvider) {
                                                      _isLoading = false;
                                                      return Container(
                                                        width: 163,
                                                        height: 163,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image:
                                                                    imageProvider,
                                                                fit: BoxFit
                                                                    .contain)),
                                                      );
                                                    },
                                                    placeholder:
                                                        (context, url) {
                                                      return _isLoading
                                                          ? Container(
                                                              width: 163,
                                                              height: 163,
                                                              child: Center(
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: AppColors
                                                                      .primary,
                                                                ),
                                                              ),
                                                            )
                                                          : Container();
                                                    },
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Container(
                                                      width: 163,
                                                      height: 163,
                                                      child: Icon(Icons.error),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0,
                                                  bottom: 8.0,
                                                  right: 8.0,
                                                  left: 8.0),
                                              child: Text(
                                                details[index]['products']
                                                    ['pro_name'],
                                                softWrap: true,
                                                style: TextStyle(
                                                  color: AppColors.dark,
                                                  fontFamily: AppFontFamily
                                                      .fontSecondary,
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "\$" +
                                                            details[index][
                                                                        'products']
                                                                    [
                                                                    'pro_price']
                                                                .toString(),
                                                        softWrap: true,
                                                        style: TextStyle(
                                                          color: AppColors.dark,
                                                          fontFamily:
                                                              AppFontFamily
                                                                  .fontSecondary,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 8.0,
                                                      ),
                                                      Text(
                                                        "x" +
                                                            details[index]
                                                                    ['quantity']
                                                                .toString(),
                                                        softWrap: true,
                                                        style: TextStyle(
                                                          color: AppColors.dark,
                                                          fontFamily:
                                                              AppFontFamily
                                                                  .fontSecondary,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    "\$" +
                                                        details[index]['total']
                                                            .toString(),
                                                    softWrap: true,
                                                    style: TextStyle(
                                                      color: AppColors.red,
                                                      fontFamily: AppFontFamily
                                                          .fontSecondary,
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "ID: " + idOrder,
                                                softWrap: true,
                                                style: TextStyle(
                                                  color: AppColors.dark,
                                                  fontFamily: AppFontFamily
                                                      .fontSecondary,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(getStatusOrder(statusOrder),
                                          style:
                                              TextStyle(color: Colors.white)),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                AppColors.third),
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                        padding: MaterialStateProperty.all<
                                            EdgeInsets>(
                                          EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 16),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            });

            return Column(
              children: storeWidgets,
            );
          },
        );
      },
    );
  }
}
