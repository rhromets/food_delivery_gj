import 'package:flutter/material.dart';
import 'package:food_delivery_gj/base/no_data_page.dart';
import 'package:food_delivery_gj/controllers/cart_controller.dart';
import 'package:food_delivery_gj/controllers/popular_product_controller.dart';
import 'package:food_delivery_gj/controllers/recommended_product_controller.dart';
import 'package:food_delivery_gj/models/cart_model.dart';
import 'package:food_delivery_gj/routes/route_helper.dart';
import 'package:food_delivery_gj/utils/app_constants.dart';
import 'package:food_delivery_gj/utils/colors.dart';
import 'package:food_delivery_gj/utils/dimentions.dart';
import 'package:food_delivery_gj/widgets/widgets.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20 * 3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
                SizedBox(width: Dimensions.width20 * 5),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),
          GetBuilder<CartController>(
            builder: (cartController) {
              return cartController.getItems.isNotEmpty
                  ? _cartPageBody(context)
                  : const NoDataPage(text: 'Your cart is empty');
            },
          ),
        ],
      ),
      bottomNavigationBar:
          GetBuilder<CartController>(builder: (cartController) {
        return Container(
          height: Dimensions.bottomHeightBar,
          padding: EdgeInsets.symmetric(
            vertical: Dimensions.height30,
            horizontal: Dimensions.width20,
          ),
          decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20 * 2),
              topRight: Radius.circular(Dimensions.radius20 * 2),
            ),
          ),
          child: cartController.getItems.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: Dimensions.height10 + 6,
                        horizontal: Dimensions.width20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: Dimensions.width10 / 2),
                          BigText(text: '\$${cartController.totalAmount}'),
                          SizedBox(width: Dimensions.width10 / 2),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        cartController.addToHistory();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: Dimensions.height10 + 6,
                          horizontal: Dimensions.width20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.mainColor,
                        ),
                        child: const BigText(
                          text: 'Check out',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
        );
      }),
    );
  }

  Positioned _cartPageBody(BuildContext context) {
    return Positioned(
      top: Dimensions.height20 * 5,
      left: Dimensions.width20,
      right: Dimensions.width20,
      bottom: 0,
      child: Container(
        margin: EdgeInsets.only(top: Dimensions.height15),
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: GetBuilder<CartController>(
            builder: (cartController) {
              List<CartModel> cartList = cartController.getItems;
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: cartList.length,
                  itemBuilder: (_, index) {
                    return SizedBox(
                      height: Dimensions.height20 * 5,
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              var popularIndex =
                                  Get.find<PopularProductController>()
                                      .popularProducList
                                      .indexOf(cartList[index].product!);
                              if (popularIndex >= 0) {
                                Get.toNamed(RouteHelper.getPopularFood(
                                    popularIndex, 'cartPage'));
                              } else {
                                var recommendedIndex =
                                    Get.find<RecommendedProductController>()
                                        .recommendedProductList
                                        .indexOf(cartList[index].product!);
                                if (recommendedIndex < 0) {
                                  Get.snackbar(
                                    'History product',
                                    'Product review is not availble for history products',
                                    backgroundColor: AppColors.mainColor,
                                    colorText: Colors.white,
                                  );
                                } else {
                                  Get.toNamed(RouteHelper.getRecommendedFood(
                                      recommendedIndex, 'cart-page'));
                                }
                              }
                            },
                            child: Container(
                              width: Dimensions.height20 * 5,
                              height: Dimensions.height20 * 5,
                              margin: EdgeInsets.symmetric(
                                  vertical: Dimensions.height10 / 2),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      '${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}${cartController.getItems[index].img}'),
                                ),
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius20),
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: Dimensions.height20 * 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  BigText(
                                    text:
                                        '${cartController.getItems[index].name}',
                                    color: Colors.black54,
                                  ),
                                  const SmallText(text: 'Spicy'),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BigText(
                                        text:
                                            '\$${cartController.getItems[index].price}',
                                        color: Colors.redAccent,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: Dimensions.height10 / 2,
                                          horizontal: Dimensions.width10,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius20),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                cartController.addItem(
                                                    cartList[index].product!,
                                                    -1);
                                              },
                                              child: const Icon(Icons.remove,
                                                  color: AppColors.singColor),
                                            ),
                                            SizedBox(
                                                width: Dimensions.width10 / 2),
                                            BigText(
                                                text:
                                                    '${cartList[index].quantity}'),
                                            SizedBox(
                                                width: Dimensions.width10 / 2),
                                            GestureDetector(
                                              onTap: () {
                                                cartController.addItem(
                                                    cartList[index].product!,
                                                    1);
                                              },
                                              child: const Icon(Icons.add,
                                                  color: AppColors.singColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}
