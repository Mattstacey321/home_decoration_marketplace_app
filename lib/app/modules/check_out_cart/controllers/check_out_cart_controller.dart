import 'package:get/get.dart';
import 'package:home_decoration_marketplace/app/data/models/cart_model.dart';
import 'package:home_decoration_marketplace/app/modules/your_cart/controllers/your_cart_controller.dart';
import 'package:home_decoration_marketplace/app/routes/app_pages.dart';
import 'package:home_decoration_marketplace/app/utils/get_id_key.dart';

class CheckOutCartController extends GetxController {
  var isUseCoupon = false.obs;
  var _carts = <CartModel>[].obs;
  var totalMoney = 0.0.obs;
  static const CHECKOUTCART = GetIdKey.CHECKOUTCART;

  List<CartModel> get carts => _carts;
  int get totalCartItem => _carts.length;

  void loadPurchaseProduct() {
    _carts = YourCartController.to.carts;
    totalMoney.value = YourCartController.to.totalMoney;
    update([CHECKOUTCART]);
  }

  void backToHome() {
    _carts.clear();
    totalMoney.value = 0;
    Get.toNamed(Routes.HOME);
  }

  @override
  void onReady() {
    loadPurchaseProduct();
    super.onReady();
  }
}
