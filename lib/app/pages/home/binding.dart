import 'package:bapsang_app/app/services/foodPosition/service.dart';
import 'package:get/get.dart';

import 'controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
    Get.lazyPut(() => FoodPositionService());
  }
}
