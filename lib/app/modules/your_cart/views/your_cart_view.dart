import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_decoration_marketplace/app/data/models/product_model.dart';
import 'package:home_decoration_marketplace/app/global_widgets/custom_button.dart';
import 'package:home_decoration_marketplace/app/modules/your_cart/controllers/your_cart_controller.dart';
import 'package:home_decoration_marketplace/app/modules/your_cart/widgets/cart_item.dart';
import 'package:home_decoration_marketplace/app/routes/app_pages.dart';
import 'package:home_decoration_marketplace/app/theme/app_color.dart';
import 'package:home_decoration_marketplace/app/theme/app_style.dart';

class YourCartView extends GetView<YourCartController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.65,
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: <Widget>[
          Container(width: 65, child: Divider(thickness: 3, color: Colors.grey.withOpacity(0.2))),
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                "My Cart",
                style: AppStyles.myCartTitle,
              ),
              SizedBox(width: 10),
              Container(
                height: 35,
                width: 85,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.mainColor, borderRadius: BorderRadius.circular(10)),
                child: Obx(
                    () => Text("${controller.totalPending} items", style: AppStyles.totalCartItem)),
              )
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            flex: 5,
            child: Container(
              width: Get.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemCount: controller.totalPending,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  itemBuilder: (context, index) {
                    ProductModel product = controller.carts[index].product;
                    return CartItem(product: product);
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Obx(
            () => Align(
              alignment: Alignment.centerRight,
              child: RichText(
                text: TextSpan(
                  style: AppStyles.totalMoneyCart,
                  children: [
                    TextSpan(
                        text: "Total: ",
                        style: AppStyles.totalMoneyCart.copyWith(color: Colors.black)),
                    TextSpan(
                      text: r'$' "${controller.totalMoney}",
                      style: AppStyles.totalMoneyCart,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          CustomButton(
            onTap: () {
              Get.toNamed(Routes.CHECK_OUT_CART);
            },
            height: 50,
            width: Get.width,
            backgroundColor: AppColors.mainColor,
            tooltip: "Check out cart",
            childs: [
              Text(
                "CHECKOUT CART",
                style: TextStyle(color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
