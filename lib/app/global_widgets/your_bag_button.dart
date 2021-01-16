import 'package:bot_toast/bot_toast.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_decoration_marketplace/app/modules/your_cart/controllers/your_cart_controller.dart';
import 'package:home_decoration_marketplace/app/modules/your_cart/views/your_cart_view.dart';
import 'package:home_decoration_marketplace/app/theme/app_color.dart';

class YourBagButton extends GetView<YourCartController> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FloatingActionButton(
          onPressed: () {
            // show cart when user is buy any product
            controller.hasPendingProductList ? 
            Get.bottomSheet(
              YourCartView(),backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(10),
                  right: Radius.circular(10),
                ),
              ),enableDrag: true,isScrollControlled: true
            ) : BotToast.showText(text: "You cart is empty ツ");
          },
          backgroundColor: AppColors.mainColor,
          child: Icon(
            EvaIcons.shoppingBagOutline,
            size: 28,
          ),
        ),
        Obx(
          () => controller.hasPendingProductList
              ? Positioned(
                  bottom: 8,
                  right: 10,
                  child: Container(
                    height: 18,
                    width: 18,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                    child: Text(
                      "${controller.totalPending}",
                      style:
                          TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              : SizedBox(),
        )
      ],
    );
  }
}
