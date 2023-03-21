class User {
  bool? success;
  String? message;
  String? accessToken;
  String? refreshToken;
  Data? data;

  User(
      {this.success,
      this.message,
      this.accessToken,
      this.refreshToken,
      this.data});

  User.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? cusId;
  String? accId;
  String? accPhone;
  String? cusUserName;
  String? cusEmail;
  String? cusGender;
  String? cusAddress;
  String? cusAvatar;

  Data(
      {this.cusId,
      this.accId,
      this.accPhone,
      this.cusUserName,
      this.cusEmail,
      this.cusGender,
      this.cusAddress,
      this.cusAvatar});

  Data.fromJson(Map<String, dynamic> json) {
    cusId = json['cus_id'];
    accId = json['acc_id'];
    accPhone = json['acc_phone'];
    cusUserName = json['cus_userName'];
    cusEmail = json['cus_email'];
    cusGender = json['cus_gender'];
    cusAddress = json['cus_address'];
    cusAvatar = json['cus_avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cus_id'] = this.cusId;
    data['acc_id'] = this.accId;
    data['acc_phone'] = this.accPhone;
    data['cus_userName'] = this.cusUserName;
    data['cus_email'] = this.cusEmail;
    data['cus_gender'] = this.cusGender;
    data['cus_address'] = this.cusAddress;
    data['cus_avatar'] = this.cusAvatar;
    return data;
  }
}
