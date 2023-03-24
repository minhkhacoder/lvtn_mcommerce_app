class Payment {
  bool? success;
  List<Data>? data;

  Payment({this.success, this.data});

  Payment.fromJson(Map<String, dynamic> json) {
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
  String? payId;
  String? payName;
  String? payAvatar;

  Data({this.payId, this.payName, this.payAvatar});

  Data.fromJson(Map<String, dynamic> json) {
    payId = json['pay_id'];
    payName = json['pay_name'];
    payAvatar = json['pay_avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pay_id'] = this.payId;
    data['pay_name'] = this.payName;
    data['pay_avatar'] = this.payAvatar;
    return data;
  }
}
