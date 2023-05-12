import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:mcommerce_app/models/cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  List<Cart> _carts = [];

  List<Cart> get carts => _carts;

  void addToCart(Map<String, dynamic> item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cart = prefs.getString('cart') ?? '[]';

    List<dynamic> cartList = [];

    if (json.decode(cart) is List) {
      cartList = json.decode(cart);
    }

    List<Cart> newCart = cartList.map((item) {
      return Cart.fromJson(item);
    }).toList();
    bool found = false;
    for (int i = 0; i < newCart.length; i++) {
      if (newCart[i].id == item['id']) {
        int? existingQuantity = newCart[i].quantity;
        if (existingQuantity != null) {
          newCart[i].quantity = (existingQuantity + item['quantity']) as int?;
        }
        found = true;
        break;
      }
    }

    if (!found) {
      newCart.add(Cart(
        id: item['id'],
        name: item['name'],
        price: item['price'],
        image: item['image'],
        quantity: item['quantity'],
      ));
    }
    prefs.setString('cart', json.encode(newCart));
    _carts = newCart;

    notifyListeners();
  }

  

  double get totalPrice {
    double totalPrice = 0.0;
    for (int i = 0; i < _carts.length; i++) {
      String? price = _carts[i].price;
      int? quantity = _carts[i].quantity;
      totalPrice += (double.parse(price!) * (quantity ?? 1.0));
    }
    return totalPrice;
  }

  void resetCarts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('cart', json.encode({}));
    _carts.clear();
    notifyListeners();
  }

  Future<void> loadCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cart = prefs.getString('cart') ?? '[]';
    List<dynamic> cartList = [];

    if (json.decode(cart) is List) {
      cartList = json.decode(cart);
    }

    List<Cart> newCart = cartList.map((item) {
      return Cart.fromJson(item);
    }).toList();
    _carts = newCart;
    notifyListeners();
  }

  void updateCartItem(String id, int quantity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cart = prefs.getString('cart') ?? '[]';

    List<dynamic> cartList = [];

    if (json.decode(cart) is List) {
      cartList = json.decode(cart);
    }

    List<Cart> newCart = cartList.map((item) {
      return Cart.fromJson(item);
    }).toList();
    for (int i = 0; i < newCart.length; i++) {
      if (newCart[i].id == id) {
        newCart[i].quantity = quantity;
        break;
      }
    }

    prefs.setString('cart', json.encode(newCart));
    _carts = newCart;

    notifyListeners();
  }

  void deleteCartItem(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cart = prefs.getString('cart') ?? '[]';

    List<dynamic> cartList = [];

    if (json.decode(cart) is List) {
      cartList = json.decode(cart);
    }

    List<Cart> newCart = cartList.map((item) {
      return Cart.fromJson(item);
    }).toList();
    newCart.removeWhere((item) => item.id == id);

    prefs.setString('cart', json.encode(newCart));
    _carts = newCart;

    notifyListeners();
  }
}
