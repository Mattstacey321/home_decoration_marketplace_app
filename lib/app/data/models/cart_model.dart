import 'package:flutter/material.dart';
import 'package:home_decoration_marketplace/app/data/models/product_model.dart';

class CartModel {
  ProductModel product;
  int quantity = 0;
  CartModel({@required this.product,@required this.quantity});
}
