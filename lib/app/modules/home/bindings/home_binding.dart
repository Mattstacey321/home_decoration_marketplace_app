import 'package:get/get.dart';

import 'package:home_decoration_marketplace/app/modules/home/controllers/home_controller.dart';
import 'package:home_decoration_marketplace/app/modules/your_cart/controllers/your_cart_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.put(YourCartController(),permanent: true);
  }
}
