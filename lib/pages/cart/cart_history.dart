import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery_gj/controllers/cart_controller.dart';
import 'package:food_delivery_gj/models/cart_model.dart';
import 'package:food_delivery_gj/routes/route_helper.dart';
import 'package:food_delivery_gj/utils/app_constants.dart';
import 'package:food_delivery_gj/utils/colors.dart';
import 'package:food_delivery_gj/utils/dimentions.dart';
import 'package:food_delivery_gj/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList =
        Get.find<CartController>().getCartHistoryList().reversed.toList();

    Map<String, int> cartItemsPerOrder = {};

    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent((getCartHistoryList[i].time!), () => 1);
      }
    }

    List<int> cartItemsPerOrderToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<String> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    List<int> itemsPerOrder = cartItemsPerOrderToList();

    var listCounter = 0;

    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppColors.mainColor,
            width: double.maxFinite,
            height: Dimensions.height10 * 10,
            padding: EdgeInsets.only(top: Dimensions.height45),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(text: 'Cart History', color: Colors.white),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.yellowColor,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView(
                  children: [
                    for (int i = 0; i < itemsPerOrder.length; i++)
                      Container(
                        height: Dimensions.height45 * 3,
                        margin: EdgeInsets.only(bottom: Dimensions.height20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (() {
                              DateTime parseDate =
                                  DateFormat('yyyy-MM-dd HH:mm:ss').parse(
                                      getCartHistoryList[listCounter].time!);
                              var inputDate =
                                  DateTime.parse(parseDate.toString());
                              var outputFormat =
                                  DateFormat('dd/MM/yyyy hh:mm a');
                              var outputDate = outputFormat.format(inputDate);
                              return BigText(text: outputDate);
                            }()),
                            SizedBox(height: Dimensions.height10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Wrap(
                                  direction: Axis.horizontal,
                                  children:
                                      List.generate(itemsPerOrder[i], (index) {
                                    if (listCounter <
                                        getCartHistoryList.length) {
                                      listCounter++;
                                    }
                                    return index <= 2
                                        ? Container(
                                            height: Dimensions.height40 * 2,
                                            width: Dimensions.width20 * 4,
                                            margin: EdgeInsets.only(
                                                right: Dimensions.width10 / 2),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius15 / 2),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}${getCartHistoryList[listCounter - 1].img}"),
                                              ),
                                            ),
                                          )
                                        : Container();
                                  }),
                                ),
                                SizedBox(
                                  height: Dimensions.height30 * 3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const SmallText(
                                        text: 'Total',
                                        color: AppColors.titleColor,
                                      ),
                                      BigText(
                                        text: '${itemsPerOrder[i]} Items',
                                        color: AppColors.titleColor,
                                      ),
                                      _orderAgainButton(cartOrderTimeToList,
                                          getCartHistoryList, i),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  GestureDetector _orderAgainButton(List<String> Function() cartOrderTimeToList,
      List<CartModel> getCartHistoryList, int i) {
    return GestureDetector(
      onTap: () {
        var orderTime = cartOrderTimeToList();
        Map<int, CartModel> moreOrder = {};
        for (int j = 0; j < getCartHistoryList.length; j++) {
          if (getCartHistoryList[j].time == orderTime[i]) {
            moreOrder.putIfAbsent(
              getCartHistoryList[j].id!,
              () => CartModel.fromJson(
                jsonDecode(jsonEncode(getCartHistoryList[j])),
              ),
            );
          }
        }
        Get.find<CartController>().setItems = moreOrder;
        Get.find<CartController>().addToCartList();
        Get.toNamed(RouteHelper.getCartPage());
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width10,
          vertical: Dimensions.height10 / 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Dimensions.radius15 / 3,
          ),
          border: Border.all(
            width: 1,
            color: AppColors.mainColor,
          ),
        ),
        child: const SmallText(
          text: 'order again',
          color: AppColors.mainColor,
        ),
      ),
    );
  }
}
