import 'package:food_delivery_gj/controllers/cart_controller.dart';
import 'package:food_delivery_gj/controllers/popular_product_controller.dart';
import 'package:food_delivery_gj/controllers/recommended_product_controller.dart';
import 'package:food_delivery_gj/data/api/api_client.dart';
import 'package:food_delivery_gj/data/repository/cart_repo.dart';
import 'package:food_delivery_gj/data/repository/popular_product_repo.dart';
import 'package:food_delivery_gj/data/repository/recommended_product_repo.dart';
import 'package:food_delivery_gj/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  // repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  // controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
