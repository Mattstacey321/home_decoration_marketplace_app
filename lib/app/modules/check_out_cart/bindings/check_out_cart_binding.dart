import 'package:get/get.dart';

import 'package:home_decoration_marketplace/app/modules/check_out_cart/controllers/check_out_cart_controller.dart';

class CheckOutCartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckOutCartController>(
      () => CheckOutCartController(),
    );
  }
}
