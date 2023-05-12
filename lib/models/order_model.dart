class Order {
  String? accId;
  String? shipId;
  String? payId;
  String? orAddress;
  List<OrderDetail>? orderDetail;

  Order(
      {this.accId, this.shipId, this.payId, this.orAddress, this.orderDetail});

  Order.fromJson(Map<String, dynamic> json) {
    accId = json['acc_id'];
    shipId = json['ship_id'];
    payId = json['pay_id'];
    orAddress = json['or_address'];
    if (json['order_detail'] != null) {
      orderDetail = <OrderDetail>[];
      json['order_detail'].forEach((v) {
        orderDetail!.add(new OrderDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['acc_id'] = this.accId;
    data['ship_id'] = this.shipId;
    data['pay_id'] = this.payId;
    data['or_address'] = this.orAddress;
    if (this.orderDetail != null) {
      data['order_detail'] = this.orderDetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderDetail {
  String? proId;
  int? ordtQuantity;
  OrderDetail({this.proId, this.ordtQuantity});

  OrderDetail.fromJson(Map<String, dynamic> json) {
    proId = json['pro_id'];
    ordtQuantity = json['ordt_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pro_id'] = this.proId;
    data['ordt_quantity'] = this.ordtQuantity;
    return data;
  }
}
