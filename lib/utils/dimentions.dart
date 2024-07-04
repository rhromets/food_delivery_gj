import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screeWidth = Get.context!.width;

  static double pageView = screenHeight / 2.64;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;
  // dynamic height padding and margin
  static double height5 = screenHeight / 168.8;
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height40 = screenHeight / 21.1;
  static double height45 = screenHeight / 18.75;
  // dynamic width padding and margin
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;

  static double font20 = screenHeight / 42.2;

  // radius
  static double radius15 = screenHeight / 56.26;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  // icon Size
  static double iconSize24 = screenHeight / 35.17;

  // list view size
  static double listViewImgSize = screeWidth / 3.25;
  static double listViewTextContSize = screeWidth / 3.9;
}
