import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_decoration_marketplace/app/global_widgets/custom_app_bar.dart';
import 'package:home_decoration_marketplace/app/global_widgets/custom_button.dart';
import 'package:home_decoration_marketplace/app/modules/check_out_cart/controllers/check_out_cart_controller.dart';
import 'package:home_decoration_marketplace/app/modules/check_out_cart/widgets/produc_itemt_preview.dart';
import 'package:home_decoration_marketplace/app/theme/app_color.dart';

class PaymentSuccess extends GetView<CheckOutCartController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(childs: [], onTapBack: () => Get.back()),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton(
              height: 100,
              width: 100,
              onTap: null,
              radius: 30,
              backgroundColor: AppColors.mainColor,
              childs: [
                Icon(
                  EvaIcons.checkmarkCircle2,
                  color: Colors.white,
                  size: 45,
                )
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Payment Successfull!",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text("Order will arrive in 3 days",
                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
            SizedBox(height: 40),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemCount: controller.totalCartItem,
                itemBuilder: (context, index) {
                  final carts = controller.carts;
                  String name = carts[index].product.name;
                  String imagePath = carts[index].product.imagePath;
                  return ProductItemPreview(image: imagePath, name: name);
                },
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: CustomButton(
                  height: 50,
                  width: 200,
                  onTap: () {
                    controller.backToHome();
                    
                  },
                  backgroundColor: AppColors.mainColor,
                  childs: [
                    Text(
                      "BACK TO HOME",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
