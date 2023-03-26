class Delivery {
  bool? success;
  List<Data>? data;

  Delivery({this.success, this.data});

  Delivery.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? shipId;
  String? shipType;
  int? shipFee;
  String? shipTime;
  String? shipAvatar;

  Data(
      {this.shipId,
      this.shipType,
      this.shipFee,
      this.shipTime,
      this.shipAvatar});

  Data.fromJson(Map<String, dynamic> json) {
    shipId = json['ship_id'];
    shipType = json['ship_type'];
    shipFee = json['ship_fee'];
    shipTime = json['ship_time'];
    shipAvatar = json['ship_avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ship_id'] = this.shipId;
    data['ship_type'] = this.shipType;
    data['ship_fee'] = this.shipFee;
    data['ship_time'] = this.shipTime;
    data['ship_avatar'] = this.shipAvatar;
    return data;
  }
}
