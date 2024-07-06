import 'package:flutter/material.dart';
import 'package:food_delivery_gj/utils/colors.dart';
import 'package:food_delivery_gj/utils/dimentions.dart';
import 'package:food_delivery_gj/widgets/widgets.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(30),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
                child: BigText(
                  text: 'Chinese Side',
                  size: Dimensions.font26,
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/food0.png',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: Dimensions.width20,
                  ),
                  child: const ExpandableTextWidget(
                      text:
                          'Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilan.Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilan.Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilan.Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilan.Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilan. Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilan. Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilan. Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, then layered with fried onions, fresh coriander cilan, Chicken marinated in a spiced yoghurt is placed in a large pot, then layered with fried onions, fresh coriander cilan'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                vertical: Dimensions.height10,
                horizontal: Dimensions.width20 * 2.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  iconSize: Dimensions.iconSize24,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
                BigText(
                  text: '\$12.88 X 0',
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                AppIcon(
                  icon: Icons.add,
                  iconSize: Dimensions.iconSize24,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
          Container(
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
                  child: const Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
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
        ],
      ),
    );
  }
}
