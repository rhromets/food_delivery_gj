// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:food_delivery_gj/pages/food/popular_food_detail.dart';
import 'package:food_delivery_gj/pages/food/recommended_food_detail.dart';
import 'package:food_delivery_gj/pages/home/main_food_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MainFoodPage(),
      // home: const PopularFoodDetail(),
      home: const RecommendedFoodDetail(),
    );
  }
}
