class Seller {
  String? sellerId;
  String? accId;
  String? sellerName;
  String? sellerDesc;
  String? sellerAddress;
  String? sellerAvatar;

  Seller(
      {this.sellerId,
      this.accId,
      this.sellerName,
      this.sellerDesc,
      this.sellerAddress,
      this.sellerAvatar});

  Seller.fromJson(Map<String, dynamic> json) {
    sellerId = json['seller_id'];
    accId = json['acc_id'];
    sellerName = json['seller_name'];
    sellerDesc = json['seller_desc'];
    sellerAddress = json['seller_address'];
    sellerAvatar = json['seller_avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seller_id'] = this.sellerId;
    data['acc_id'] = this.accId;
    data['seller_name'] = this.sellerName;
    data['seller_desc'] = this.sellerDesc;
    data['seller_address'] = this.sellerAddress;
    data['seller_avatar'] = this.sellerAvatar;
    return data;
  }
}
