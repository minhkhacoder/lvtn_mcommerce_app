import 'package:mcommerce_app/models/seller_model.dart';

class OrderDetail {
  bool? success;
  List<DataOrderDetail>? data;

  OrderDetail({this.success, this.data});

  OrderDetail.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <DataOrderDetail>[];
      json['data'].forEach((v) {
        data!.add(new DataOrderDetail.fromJson(v));
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

class DataOrderDetail {
  String? orId;
  String? accId;
  int? ship;
  String? payment;
  String? address;
  int? status;
  String? createdAt;
  List<Details>? details;

  DataOrderDetail(
      {this.orId,
      this.accId,
      this.ship,
      this.payment,
      this.address,
      this.status,
      this.createdAt,
      this.details});

  DataOrderDetail.fromJson(Map<String, dynamic> json) {
    orId = json['or_id'];
    accId = json['acc_id'];
    ship = json['ship'];
    payment = json['payment'];
    address = json['address'];
    status = json['status'];
    createdAt = json['createdAt'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(new Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['or_id'] = this.orId;
    data['acc_id'] = this.accId;
    data['ship'] = this.ship;
    data['payment'] = this.payment;
    data['address'] = this.address;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    if (this.details != null) {
      data['details'] = this.details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  String? ordtId;
  int? quantity;
  double? total;
  ProductsOrderDetail? products;

  Details({this.ordtId, this.quantity, this.total, this.products});

  Details.fromJson(Map<String, dynamic> json) {
    ordtId = json['ordt_id'];
    quantity = json['quantity'];
    total = json['total'];
    products = json['products'] != null
        ? new ProductsOrderDetail.fromJson(json['products'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ordt_id'] = this.ordtId;
    data['quantity'] = this.quantity;
    data['total'] = this.total;
    if (this.products != null) {
      data['products'] = this.products!.toJson();
    }
    return data;
  }
}

class ProductsOrderDetail {
  String? proId;
  String? catId;
  String? braId;
  String? sellerId;
  String? prodId;
  String? proName;
  String? proDesc;
  String? proMaterial;
  double? proPrice;
  int? proQuantity;
  int? proStatus;
  String? image;
  Seller? seller;

  ProductsOrderDetail(
      {this.proId,
      this.catId,
      this.braId,
      this.sellerId,
      this.prodId,
      this.proName,
      this.proDesc,
      this.proMaterial,
      this.proPrice,
      this.proQuantity,
      this.proStatus,
      this.image,
      this.seller});

  ProductsOrderDetail.fromJson(Map<String, dynamic> json) {
    proId = json['pro_id'];
    catId = json['cat_id'];
    braId = json['bra_id'];
    sellerId = json['seller_id'];
    prodId = json['prod_id'];
    proName = json['pro_name'];
    proDesc = json['pro_desc'];
    proMaterial = json['pro_material'];
    proPrice = json['pro_price'];
    proQuantity = json['pro_quantity'];
    proStatus = json['pro_status'];
    image = json['image'];
    seller =
        json['seller'] != null ? new Seller.fromJson(json['seller']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pro_id'] = this.proId;
    data['cat_id'] = this.catId;
    data['bra_id'] = this.braId;
    data['seller_id'] = this.sellerId;
    data['prod_id'] = this.prodId;
    data['pro_name'] = this.proName;
    data['pro_desc'] = this.proDesc;
    data['pro_material'] = this.proMaterial;
    data['pro_price'] = this.proPrice;
    data['pro_quantity'] = this.proQuantity;
    data['pro_status'] = this.proStatus;
    data['image'] = this.image;
    if (this.seller != null) {
      data['seller'] = this.seller!.toJson();
    }
    return data;
  }
}
