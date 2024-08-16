import 'package:flutter/material.dart';
import 'package:food_delivery_gj/controllers/cart_controller.dart';
import 'package:food_delivery_gj/data/repository/popular_product_repo.dart';
import 'package:food_delivery_gj/models/cart_model.dart';
import 'package:food_delivery_gj/models/products_model.dart';
import 'package:food_delivery_gj/utils/colors.dart';
import 'package:get/get.dart';
import 'dart:async';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<ProductsModel> _popularProducList = [];
  List<ProductsModel> get popularProducList => _popularProducList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Timer? _snackbarTimer;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProducList = [];
      _popularProducList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      _showSnackbarOnce(
        title: 'Item count',
        text: 'You can\'t reduce more',
      );
      
      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      _showSnackbarOnce(
        title: 'Item count',
        text: 'You can\'t add more',
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void _showSnackbarOnce({
    required String title,
    required String text,
  }) {
    if (_snackbarTimer == null || !_snackbarTimer!.isActive) {
      Get.snackbar(
        title,
        text,
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );

      _snackbarTimer = Timer(const Duration(seconds: 3), () {
        _snackbarTimer = null;
      });
    }
  }

  void initProduct(ProductsModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    bool exist = false;
    exist = _cart.existInCart(product);
    // if exist
    // get from storage _inCartItems
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
  }

  void addItem(ProductsModel product) {
    _cart.addItem(product, quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
