import 'package:get/get.dart';
import 'package:home_decoration_marketplace/app/data/models/product_model.dart';
import 'package:home_decoration_marketplace/app/modules/home/controllers/home_controller.dart';
import 'package:home_decoration_marketplace/app/utils/get_id_key.dart';

class ProductDetailController extends GetxController {
  String _sku;
  ProductDetailController(String sku) : this._sku = sku;
  var product = Rx<ProductModel>();
  static const PRODUCT_DETAIL = GetIdKey.PRODUCT_DETAIL;

  void getProductDetail() async {
    product.value = await Future.delayed(
        2.seconds, () => HomeController.to.productList.firstWhere((item) => item.sku == _sku));
    update([PRODUCT_DETAIL]);
    print(product.value);
  }

  @override
  void onReady() {
    getProductDetail();
    super.onReady();
  }
}
