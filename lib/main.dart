import 'package:flutter/material.dart';
import 'package:food_delivery_gj/controllers/cart_controller.dart';
import 'package:food_delivery_gj/controllers/popular_product_controller.dart';
import 'package:food_delivery_gj/controllers/recommended_product_controller.dart';
import 'package:food_delivery_gj/routes/route_helper.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(
      builder: (_) {
        return GetBuilder<RecommendedProductController>(
          builder: (_) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Food Delivery App',
              initialRoute: RouteHelper.getSplashPage(),
              getPages: RouteHelper.routes,
            );
          },
        );
      },
    );
  }
}
