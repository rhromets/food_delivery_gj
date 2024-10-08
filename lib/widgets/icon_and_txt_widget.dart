import 'package:flutter/material.dart';
import 'package:food_delivery_gj/utils/dimentions.dart';
import 'package:food_delivery_gj/widgets/widgets.dart';

class IconAndTxtWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const IconAndTxtWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimensions.iconSize24,
        ),
        const SizedBox(width: 5),
        SmallText(
          text: text,
        ),
      ],
    );
  }
}
