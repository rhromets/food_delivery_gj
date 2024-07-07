import 'package:food_delivery_gj/pages/food/popular_food_detail.dart';
import 'package:food_delivery_gj/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = '/';
  static const String popularFood = '/popular-food';

  static List<GetPage> routes = [
    GetPage(name: '/', page: () => const MainFoodPage()),
    GetPage(
      name: popularFood,
      page: () => const PopularFoodDetail(),
      transition: Transition.fadeIn,
    ),
  ];
}
