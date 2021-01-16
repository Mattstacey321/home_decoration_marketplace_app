import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get.dart';
import 'package:home_decoration_marketplace/app/data/api/sample_api.dart';
import 'package:home_decoration_marketplace/app/data/models/category_model.dart';
import 'package:home_decoration_marketplace/app/data/models/product_model.dart';

Future initServices() async {
  ProductServices productServices = ProductServices();
  await Get.putAsync(() => productServices._initializeProduct());
  await Get.putAsync(() => productServices._initializeCategories());
}

class ProductServices extends GetxService {
  static List<ProductModel> _productList = [];
  static List<CategoryModel> _categories = [];

  List<ProductModel> get productList => _productList;
  List<CategoryModel> get categories => _categories;

  Future _initializeProduct() async {
    String data = await rootBundle.loadString(SampleApi.sampleData);
    final jsonResult = json.decode(data);
    try {
      _productList = ProductListModel.fromList(jsonResult).products;
    } catch (e) {
      print(e);
    }
  }

  Future _initializeCategories() async {
    return Future.delayed(1.seconds, () => _categories = SampleApi.categories);
  }

}
