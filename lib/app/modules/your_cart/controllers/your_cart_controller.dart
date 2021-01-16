import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';
import 'package:home_decoration_marketplace/app/data/models/cart_model.dart';
import 'package:home_decoration_marketplace/app/data/models/product_model.dart';
import 'package:home_decoration_marketplace/app/data/repositories/product_repository.dart';
import 'package:home_decoration_marketplace/app/utils/get_id_key.dart';

class YourCartController extends GetxController {
  static YourCartController get to => Get.find();
  ProductRepository _productRepository = ProductRepository();
  var carts = <CartModel>[].obs;
  var _totalMoney = 0.0.obs;
  static const YOURCART = GetIdKey.YOUR_CART;
  static const QUANTITYBUTTON = GetIdKey.QUANTITYBUTTON;

  double get totalMoney => _totalMoney.value.toPrecision(2);
  bool get hasPendingProductList => carts.isNotEmpty;
  int get totalPending => carts.length;

  void addToCart(String sku) async {
    try {
      ProductModel result = await _productRepository.getBySku(sku);
      if (carts.isEmpty) {
        carts.add(CartModel(product: result, quantity: 1));
      } else {
        if (!carts.any((item) => item.product.sku == sku)) {
          carts.add(CartModel(product: result, quantity: 1));
        } else {
          carts.forEach((item) {
            if (item.product.sku == sku) {
              item.quantity++;
            }
          });
        }
      }

      BotToast.showText(text: "Add success");
    } catch (e) {
      BotToast.showText(text: "Add fail");
    }
    updateTotalMoney(true);
  }

  int currentQuantity(String sku) {
    if (carts.isEmpty) return 0;
    return carts.firstWhere((item) => item.product.sku == sku).quantity;
  }

  void onDecreaseQuantity(String sku) async {
    if (carts.firstWhere((item) => item.product.sku == sku).quantity > 1) {
      carts.firstWhere((item) => item.product.sku == sku).quantity--;
    } else {
      carts.removeWhere((item) => item.product.sku == sku);
      // close cart when these is no item left
      if (carts.length == 0) {
        Get.back();
      }
    }
    updateTotalMoney(false);
  }

  void onIncreaseQuantity(String sku) async {
    carts.firstWhere((item) => item.product.sku == sku).quantity++;
    updateTotalMoney(true);
  }

  void updateTotalMoney(bool isIncrease) {
    carts.forEach((item) {
      isIncrease
          ? _totalMoney.value += item.product.price
          : _totalMoney.value -= item.product.price;
    });
    update([YOURCART, QUANTITYBUTTON]);
  }
}
