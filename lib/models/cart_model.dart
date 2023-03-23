import 'package:mcommerce_app/models/brand_model.dart';
import 'package:mcommerce_app/models/category_model.dart';
import 'package:mcommerce_app/models/producer_model.dart';
import 'package:mcommerce_app/models/seller_model.dart';

class Cart {
  String? id;
  String? name;
  String? price;
  List<String>? image;
  int? quantity;

  Cart({this.id, this.name, this.price, this.image, this.quantity});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'].cast<String>();
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['image'] = this.image;
    data['quantity'] = this.quantity;
    return data;
  }
}
