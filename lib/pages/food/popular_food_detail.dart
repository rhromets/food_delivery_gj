import 'package:flutter/material.dart';
import 'package:food_delivery_gj/utils/colors.dart';
import 'package:food_delivery_gj/utils/dimentions.dart';
import 'package:food_delivery_gj/widgets/widgets.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
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
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/food0.png'),
                ),
              ),
            ),
          ),
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_outlined),
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
                  const AppColumn(text: 'Chinese Side'),
                  SizedBox(height: Dimensions.height20),
                  const BigText(text: 'Introduce'),
                  SizedBox(height: Dimensions.height20),
                  const Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                          text:
                              'Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilan'),
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
              child: const BigText(
                text: '\$10 | Add To Cart',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
