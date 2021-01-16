import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:home_decoration_marketplace/app/data/models/product_model.dart';
import 'package:home_decoration_marketplace/app/global_widgets/cirlce_icon.dart';
import 'package:home_decoration_marketplace/app/global_widgets/custom_app_bar.dart';
import 'package:home_decoration_marketplace/app/global_widgets/your_bag_button.dart';

import 'package:home_decoration_marketplace/app/modules/product_detail/controllers/product_detail_controller.dart';
import 'package:home_decoration_marketplace/app/modules/your_cart/controllers/your_cart_controller.dart';
import 'package:home_decoration_marketplace/app/theme/app_color.dart';
import 'package:home_decoration_marketplace/app/theme/app_loading.dart';
import 'package:home_decoration_marketplace/app/theme/app_style.dart';
import 'package:home_decoration_marketplace/app/utils/get_id_key.dart';
import 'package:home_decoration_marketplace/app/utils/is_dark_color.dart';
import 'package:home_decoration_marketplace/app/utils/product_color.dart';
import 'package:home_decoration_marketplace/app/global_widgets/custom_button.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  @override
  Widget build(BuildContext context) {
    String sku = Get.arguments;
    return SafeArea(
      child: Material(
        child: GetBuilder<ProductDetailController>(
          init: ProductDetailController(sku),
          assignId: true,
          id: GetIdKey.PRODUCT_DETAIL,
          builder: (controller) {
            if (controller.product.value == null) {
              return AppLoading.defaultLoading;
            } else {
              ProductModel product = controller.product.value;
              String image = product.imagePath;
              String name = product.name;
              ProductType type = product.type;
              String price = product.price.toString();
              List<Color> colors = getProductColor(product.colors.colors);
              String totalReview = product.totalReview.toString();
              String detail = product.details;
              double userRating = product.userRating;
              return Scaffold(
                appBar: CustomAppBar(
                  color: AppColors.main100,
                  onTapBack: () {
                    Get.back();
                  },
                  childs: [
                    Spacer(),
                    CircleIcon(
                      child: Icon(EvaIcons.share),
                      onTap: () {},
                    ),
                  ],
                ),
                floatingActionButton: YourBagButton(),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Container(
                        color: AppColors.main100,
                        padding: EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 5,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(image),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    // type and name
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(type.type),
                                          SizedBox(height: 10),
                                          Text(
                                            name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold, fontSize: 20),
                                            textAlign: TextAlign.right,
                                            maxLines: 2,
                                          )
                                        ],
                                      ),
                                    ),
                                    //price
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text("Price"),
                                          SizedBox(height: 10),
                                          Text(
                                            r'$' "$price",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: AppColors.mainColor),
                                            textAlign: TextAlign.right,
                                            maxLines: 2,
                                          )
                                        ],
                                      ),
                                    ), //color
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text("Choose Colors"),
                                          SizedBox(height: 10),
                                          Container(
                                            height: 40,
                                            child: ListView.separated(
                                              separatorBuilder: (context, index) =>
                                                  SizedBox(width: 20),
                                              itemCount: colors.length,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) => Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                  color: colors[index],
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black.withOpacity(0.2),
                                                        offset: Offset(1, 2),
                                                        blurRadius: 0.2)
                                                  ],
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: index == 0
                                                    ? Icon(EvaIcons.checkmark,
                                                        color: isDarkColor(colors[index])
                                                            ? Colors.white
                                                            : Colors.black)
                                                    : SizedBox(),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                RatingBar.builder(
                                  itemSize: 22,
                                  initialRating: userRating,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  ignoreGestures: true,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Text(
                                        "$totalReview reviews",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Icon(EvaIcons.chevronRight, color: Colors.grey)
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20),
                            Text(
                              detail,
                              style: AppStyles.productDetailStyle,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 6,
                            ),
                            Spacer(),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Row(
                                children: [
                                  CustomButton(
                                    height: 50,
                                    width: 200,
                                    tooltip: "Add to cart",
                                    backgroundColor: AppColors.mainColor,
                                    onTap: () {
                                      YourCartController.to.addToCart(product.sku);
                                    },
                                    childs: [
                                      Text(
                                        "ADD TO CART",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
