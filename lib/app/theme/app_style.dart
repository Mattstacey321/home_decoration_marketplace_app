import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_decoration_marketplace/app/theme/app_color.dart';

class AppStyles {
  static TextStyle productDetailStyle = TextStyle(color: Colors.grey, fontSize: 22);
  static TextStyle totalProductHomeView = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  static TextStyle myCartTitle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle totalCartItem =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);
  static TextStyle productPriceCart =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.mainColor);
  static TextStyle productNameCart =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.mainColor);
  static TextStyle totalMoneyCart =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.mainColor);
  static TextStyle quantityText =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold,);
}
