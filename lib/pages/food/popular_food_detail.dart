import 'package:flutter/material.dart';
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
                const AppIcon(icon: Icons.shopping_cart_outlined),
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
      bottomNavigationBar: Container(
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
                  const Icon(Icons.remove, color: AppColors.singColor),
                  SizedBox(width: Dimensions.width10 / 2),
                  const BigText(text: '0'),
                  SizedBox(width: Dimensions.width10 / 2),
                  const Icon(Icons.add, color: AppColors.singColor),
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
              child: BigText(
                text: '\$${product.price} | Add To Cart',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
