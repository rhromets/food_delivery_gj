import 'package:flutter/material.dart';
import 'package:food_delivery_gj/controllers/cart_controller.dart';
import 'package:food_delivery_gj/controllers/popular_product_controller.dart';
import 'package:food_delivery_gj/pages/home/main_food_page.dart';
import 'package:food_delivery_gj/utils/app_constants.dart';
import 'package:food_delivery_gj/utils/colors.dart';
import 'package:food_delivery_gj/utils/dimentions.dart';
import 'package:food_delivery_gj/widgets/widgets.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;

  const PopularFoodDetail({
    super.key,
    required this.pageId,
  });

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProducList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    '${AppConstants.BASE_URL}${AppConstants.UPLOAD_URL}${product.img}',
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => const MainFoodPage());
                  },
                  child: const AppIcon(icon: Icons.arrow_back_ios),
                ),
                GetBuilder<PopularProductController>(builder: (controller) {
                  return Stack(
                    children: [
                      const AppIcon(icon: Icons.shopping_cart_outlined),
                      Get.find<PopularProductController>().totalItems >= 1
                          ? const Positioned(
                              top: 0,
                              right: 0,
                              child: AppIcon(
                                icon: Icons.circle,
                                size: 20,
                                iconColor: Colors.transparent,
                                backgroundColor: AppColors.mainColor,
                              ),
                            )
                          : const SizedBox(),
                      Get.find<PopularProductController>().totalItems >= 1
                          ? Positioned(
                              top: 3,
                              right: 6,
                              child: BigText(
                                text: Get.find<PopularProductController>()
                                    .totalItems
                                    .toString(),
                                size: 12,
                                color: Colors.white,
                              ),
                            )
                          : const SizedBox(),
                    ],
                  );
                }),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.popularFoodImgSize - 20,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20),
                  topRight: Radius.circular(Dimensions.radius20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: '${product.name}'),
                  SizedBox(height: Dimensions.height20),
                  const BigText(text: 'Introduce'),
                  SizedBox(height: Dimensions.height20),
                  Expanded(
                    child: SingleChildScrollView(
                      child:
                          ExpandableTextWidget(text: '${product.description}'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (popularProduct) {
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: Dimensions.height10 + 6,
                  horizontal: Dimensions.width20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        popularProduct.setQuantity(false);
                      },
                      child:
                          const Icon(Icons.remove, color: AppColors.singColor),
                    ),
                    SizedBox(width: Dimensions.width10 / 2),
                    BigText(text: '${popularProduct.inCartItems}'),
                    SizedBox(width: Dimensions.width10 / 2),
                    GestureDetector(
                      onTap: () {
                        popularProduct.setQuantity(true);
                      },
                      child: const Icon(Icons.add, color: AppColors.singColor),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: Dimensions.height10 + 6,
                  horizontal: Dimensions.width20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.mainColor,
                ),
                child: GestureDetector(
                  onTap: () {
                    popularProduct.addItem(product);
                  },
                  child: BigText(
                    text: '\$${product.price} | Add To Cart',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
