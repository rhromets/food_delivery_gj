import 'package:food_delivery_gj/pages/cart/cart_history.dart';
import 'package:food_delivery_gj/pages/cart/cart_page.dart';
import 'package:food_delivery_gj/pages/food/popular_food_detail.dart';
import 'package:food_delivery_gj/pages/food/recommended_food_detail.dart';
import 'package:food_delivery_gj/pages/home/home_page.dart';
import 'package:food_delivery_gj/pages/splash/splash_screen.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashPage = '/splash-page';
  static const String initial = '/';
  static const String popularFood = '/popular-food';
  static const String recommendedFood = '/recommended-food';
  static const String cartPage = '/cart-page';
  static const String cartHistoryPage = '/cart-history-page';

  static String getSplashPage() => splashPage.toString();
  static String getInitial() => initial.toString();
  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => cartPage.toString();
  static String getCartHistoryPage() => cartHistoryPage.toString();

  static List<GetPage> routes = [
    GetPage(
      name: splashPage,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: initial,
      page: () => const HomePage(),
    ),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return RecommendedFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: cartPage,
      page: () {
        return const CartPage();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: cartHistoryPage,
      page: () {
        return const CartHistory();
      },
      transition: Transition.fadeIn,
    ),
  ];
}
