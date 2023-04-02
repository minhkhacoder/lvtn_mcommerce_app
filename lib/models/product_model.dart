import 'package:mcommerce_app/models/brand_model.dart';
import 'package:mcommerce_app/models/category_model.dart';
import 'package:mcommerce_app/models/producer_model.dart';
import 'package:mcommerce_app/models/seller_model.dart';

class Product {
  bool? success;
  List<Data>? data;

  Product({this.success, this.data});

  Product.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? name;
  String? desc;
  String? material;
  String? price;
  Category? category;
  DataBrand? brand;
  Producer? producer;
  Seller? seller;
  int? ratCount;
  int? averageRating;
  List<String>? image;

  Data(
      {this.id,
      this.name,
      this.desc,
      this.material,
      this.price,
      this.category,
      this.brand,
      this.producer,
      this.seller,
      this.ratCount,
      this.averageRating,
      this.image});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    material = json['material'];
    price = json['price'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    brand =
        json['brand'] != null ? new DataBrand.fromJson(json['brand']) : null;
    producer = json['producer'] != null
        ? new Producer.fromJson(json['producer'])
        : null;
    seller =
        json['seller'] != null ? new Seller.fromJson(json['seller']) : null;
    ratCount = json['rat_count'];
    averageRating = json['average_rating'];
    image = json['image'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['material'] = this.material;
    data['price'] = this.price;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    if (this.producer != null) {
      data['producer'] = this.producer!.toJson();
    }
    if (this.seller != null) {
      data['seller'] = this.seller!.toJson();
    }
    data['rat_count'] = this.ratCount;
    data['average_rating'] = this.averageRating;
    data['image'] = this.image;
    return data;
  }
}
