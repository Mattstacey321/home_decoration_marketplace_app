import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_decoration_marketplace/app/data/models/product_model.dart';
import 'package:home_decoration_marketplace/app/theme/app_color.dart';
import 'package:home_decoration_marketplace/app/theme/app_style.dart';

import 'increase_quanitity_button.dart';

class CartItem extends StatelessWidget {
  final ProductModel product;
  CartItem({@required this.product});
  @override
  Widget build(BuildContext context) {
    String productName = product.name;
    String image = product.imagePath;
    double price = product.price;
    String color = product.colors.colors[0].toUpperCase();
    return Container(
      height: 130,
      width: Get.width,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(color: AppColors.main100, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: <Widget>[
          Expanded(flex: 2, child: Image.asset(image, height: 100, width: 50, fit: BoxFit.cover)),
          SizedBox(width: 20),
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  productName,
                  style: AppStyles.productNameCart,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 10),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(flex: 3, child: IncreaseQuantityButton(sku: product.sku)),
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          height: 20,
                          child: VerticalDivider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            r'$ ' "${price.toString()}",
                            style: AppStyles.productPriceCart,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(color)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
