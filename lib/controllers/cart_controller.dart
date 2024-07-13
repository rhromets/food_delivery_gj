import 'package:flutter/material.dart';
import 'package:food_delivery_gj/data/repository/cart_repo.dart';
import 'package:food_delivery_gj/models/cart_model.dart';
import 'package:food_delivery_gj/models/products_model.dart';
import 'package:food_delivery_gj/utils/colors.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  final Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  void addItem(ProductsModel product, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          isExist: true,
          quantity: value.quantity! + quantity,
          time: DateTime.now().toString(),
          product: product,
        );
      });
      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(product.id!, () {
          return CartModel(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            isExist: true,
            quantity: quantity,
            time: DateTime.now().toString(),
            product: product,
          );
        });
      } else {
        Get.snackbar(
          'Item count',
          'You should at least add an item in the cart',
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
        );
      }
    }

    update();
  }

  bool existInCart(ProductsModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    } else {
      return false;
    }
  }

  int getQuantity(ProductsModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });

    return totalQuantity;
  }

  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  int get totalAmount {
    var total = 0;
    _items.forEach((key, val) {
      total += val.quantity! * val.price!;
    });
    return total;
  }
}
