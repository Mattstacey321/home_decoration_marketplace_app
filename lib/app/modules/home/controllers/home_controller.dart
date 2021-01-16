import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_decoration_marketplace/app/data/models/category_model.dart';
import 'package:home_decoration_marketplace/app/data/models/product_model.dart';
import 'package:home_decoration_marketplace/app/data/services/product_services.dart';
import 'package:home_decoration_marketplace/app/utils/get_id_key.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  static HomeController get to => Get.find();
  TabController tabController;
  ProductServices _productServices = ProductServices();
  var categories = <CategoryModel>[].obs;
  var productList = <ProductModel>[].obs;
  var tabView = ["Popular", "New", "Best Selling", "Blabla"];
  var sort = ["Accending", "Descending"];
  static const HOME = GetIdKey.HOME;

  int get tabViewCount => tabView.length;
  int get totalProduct => productList.length;

  void getCategories() {
    final result = _productServices.categories;
    categories.assignAll(result);
    update([HOME]);
  }

  void getProduct() {
    final result = _productServices.productList;
    productList.addAllNonNull(result);
    update([HOME]);
  }

  @override
  void onReady() {
    tabController = TabController(length: tabViewCount, vsync: this);
    getCategories();
    getProduct();
    super.onReady();
  }
}
