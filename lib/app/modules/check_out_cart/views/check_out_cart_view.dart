import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_decoration_marketplace/app/global_widgets/custom_app_bar.dart';
import 'package:home_decoration_marketplace/app/global_widgets/custom_button.dart';

import 'package:home_decoration_marketplace/app/modules/check_out_cart/controllers/check_out_cart_controller.dart';
import 'package:home_decoration_marketplace/app/modules/check_out_cart/widgets/discount_view.dart';
import 'package:home_decoration_marketplace/app/modules/check_out_cart/widgets/produc_itemt_preview.dart';
import 'package:home_decoration_marketplace/app/routes/app_pages.dart';
import 'package:home_decoration_marketplace/app/theme/app_color.dart';
import 'package:home_decoration_marketplace/app/utils/get_id_key.dart';

class CheckOutCartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<CheckOutCartController>(
      assignId: true,
      id: GetIdKey.CHECKOUTCART,
      builder: (controller) {
        return Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: CustomAppBar(
              childs: [],
              onTapBack: () => Get.back(),
            ),
            body: Padding(
              padding: EdgeInsets.all(0.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 7,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Products",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          SizedBox(height: 20),
                          Flexible(
                            child: Container(
                              height: 120,
                              width: Get.width,
                              child: ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(width: 10),
                                itemCount: controller.totalCartItem,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final carts = controller.carts;
                                  String name = carts[index].product.name;
                                  String imagePath = carts[index].product.imagePath;
                                  return ProductItemPreview(image: imagePath, name: name);
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.SHIPPING);
                            },
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              height: 80,
                              width: Get.width,
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Expanded(flex: 1, child: Icon(EvaIcons.shoppingCartOutline)),
                                  Expanded(
                                      flex: 5,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                "Shipping",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold, fontSize: 18),
                                              ),
                                              Text("3 days")
                                            ],
                                          ),
                                          Icon(EvaIcons.arrowRight)
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          InkWell(
                            onTap: () {
                              Get.bottomSheet(
                                DiscountView(),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                ),
                                backgroundColor: Colors.white,
                              );
                            },
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 80,
                              width: Get.width,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Expanded(flex: 1, child: Icon(EvaIcons.percentOutline)),
                                  Expanded(
                                      flex: 5,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                "Discount Code",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold, fontSize: 18),
                                              ),
                                              Text(r'- $' "30.00")
                                            ],
                                          ),
                                          SizedBox(width: 10),
                                          Row(
                                            children: [
                                              Container(
                                                height: 30,
                                                padding: EdgeInsets.symmetric(horizontal: 10),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: AppColors.mainColor),
                                                child: Text(
                                                  "CA****2",
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Icon(
                                                EvaIcons.checkmark,
                                                size: 18,
                                                color: AppColors.mainColor,
                                              ),
                                            ],
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  IntrinsicHeight(
                    child: Divider(),
                  ),
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: <Widget>[
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("Shipping", style: TextStyle(color: Colors.grey)),
                                      Text(
                                        "Free",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Products", style: TextStyle(color: Colors.grey)),
                                      Text(
                                        controller.totalCartItem.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total",
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                      ),
                                      Text(
                                        r'$' " ${controller.totalMoney}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.mainColor,
                                            fontSize: 18),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            CustomButton(
                                height: 50,
                                width: Get.width,
                                onTap: () {
                                  Get.toNamed(Routes.PAYMENTSUCCESS);
                                },
                                childs: [
                                  Text(
                                    "Buy Now",
                                    style:
                                        TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  )
                                ],
                                backgroundColor: AppColors.mainColor)
                          ],
                        ),
                      ))
                ],
              ),
            ));
      },
    ));
  }
}
