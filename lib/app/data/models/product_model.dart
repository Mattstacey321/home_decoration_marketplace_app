import 'package:flutter/material.dart';
import 'package:home_decoration_marketplace/app/utils/product_type.dart';

class ProductModel {
  String sku;
  String name;
  String imagePath;
  String details;
  ProductType type;
  ProductColor colors;
  double userRating;
  int totalReview;
  double price;
  ProductModel({
    @required this.sku,
    @required this.name,
    @required this.details,
    @required this.colors,
    @required this.userRating,
    @required this.price,
    @required this.type,
    @required this.imagePath,
    this.totalReview = 0,
  });
  factory ProductModel.fromJson(Map item) {
    return ProductModel(
        sku: item["sku"],
        name: item["name"],
        imagePath: item["image"],
        colors: ProductColor.fromList(item["colors"]),
        details: item["details"],
        type: ProductType(type: getProductType(item["type"])),
        price: item["price"],
        totalReview: item["totalReview"],
        userRating: item["rate"]);
  }
}

class ProductListModel {
  List<ProductModel> products;
  ProductListModel({this.products});
  factory ProductListModel.fromList(List json) {
    var products = <ProductModel>[];
    for (var item in json) {
      products.add(ProductModel.fromJson(item));
    }
    return ProductListModel(products: products);
  }
}

class ProductColor {
  List<String> colors;
  ProductColor({this.colors});
  factory ProductColor.fromList(List json) {
    var colors = <String>[];
    for (var item in json) {
      colors.add(item);
    }
    return ProductColor(colors: colors);
  }
}

class ProductType {
  String type;
  ProductType({this.type});
 
}
