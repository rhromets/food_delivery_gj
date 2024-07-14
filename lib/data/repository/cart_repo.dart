import 'dart:convert';

import 'package:food_delivery_gj/models/cart_model.dart';
import 'package:food_delivery_gj/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  void addToCartList(List<CartModel> cartList) {
    cart = [];

    // convert objects to string because sharedPreferences only accepts string
    for (var elem in cartList) {
      cart.add(jsonEncode(elem));
    }

    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    // print(sharedPreferences.getStringList(AppConstants.CART_LIST));
    getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];

    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      // print('inside getCartList $carts');
    }

    List<CartModel> cartList = [];

    for (var elem in carts) {
      cartList.add(CartModel.fromJson(jsonDecode(elem)));
    }

    return cartList;
  }
}
