import 'package:home_decoration_marketplace/app/data/models/product_model.dart';
import 'package:home_decoration_marketplace/app/data/services/product_services.dart';

class ProductRepository {
  ProductServices _productServices = ProductServices();
  Future<ProductModel> getBySku(String sku) async {
    return _productServices.productList.firstWhere((item) => item.sku == sku);
  }
}
