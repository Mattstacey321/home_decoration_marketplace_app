import 'package:get/get.dart';
import 'package:home_decoration_marketplace/app/modules/check_out_cart/bindings/check_out_cart_binding.dart';
import 'package:home_decoration_marketplace/app/modules/check_out_cart/views/check_out_cart_view.dart';
import 'package:home_decoration_marketplace/app/modules/check_out_cart/widgets/payment_success.dart';
import 'package:home_decoration_marketplace/app/modules/check_out_cart/widgets/shipping_view.dart';
import 'package:home_decoration_marketplace/app/modules/home/bindings/home_binding.dart';
import 'package:home_decoration_marketplace/app/modules/home/views/home_view.dart';
import 'package:home_decoration_marketplace/app/modules/product_detail/bindings/product_detail_binding.dart';
import 'package:home_decoration_marketplace/app/modules/product_detail/views/product_detail_view.dart';
import 'package:home_decoration_marketplace/app/modules/your_cart/views/your_cart_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAIL,
      page: () => ProductDetailView(),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: _Paths.YOUR_CART,
      page: () => YourCartView(),
    ),
    GetPage(
      name: _Paths.CHECK_OUT_CART,
      page: () => CheckOutCartView(),
      binding: CheckOutCartBinding(),
    ),
    GetPage(
      name: _Paths.SHIPPING,
      page: () => ShippingView(),
    ),
    GetPage(
      name: _Paths.PAYMENTSUCCESS,
      page: () => PaymentSuccess(),
    )
  ];
}
