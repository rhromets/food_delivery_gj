import 'package:flutter/material.dart';
import 'package:food_delivery_gj/utils/colors.dart';
import 'package:food_delivery_gj/utils/dimentions.dart';
import 'package:food_delivery_gj/widgets/widgets.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.font26,
        ),
        SizedBox(height: Dimensions.height10),
        Row(
          children: [
            Wrap(
              children: [
                ...List.generate(
                  5,
                  (index) => const Icon(
                    Icons.star,
                    color: AppColors.mainColor,
                    size: 15,
                  ),
                ),
              ],
            ),
            SizedBox(width: Dimensions.width10),
            const SmallText(text: '4.5'),
            SizedBox(width: Dimensions.width10),
            const SmallText(text: '1287'),
            SizedBox(width: Dimensions.width10),
            const SmallText(text: 'comments'),
          ],
        ),
        SizedBox(height: Dimensions.height20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTxtWidget(
              icon: Icons.circle_sharp,
              text: 'Normal',
              iconColor: AppColors.iconColor1,
            ),
            IconAndTxtWidget(
              icon: Icons.location_on,
              text: '1.7km',
              iconColor: AppColors.mainColor,
            ),
            IconAndTxtWidget(
              icon: Icons.access_time_rounded,
              text: '32min',
              iconColor: AppColors.iconColor2,
            ),
          ],
        )
      ],
    );
  }
}
