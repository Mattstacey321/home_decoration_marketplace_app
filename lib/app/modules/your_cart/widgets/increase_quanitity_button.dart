import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:home_decoration_marketplace/app/modules/your_cart/controllers/your_cart_controller.dart';
import 'package:home_decoration_marketplace/app/theme/app_style.dart';
import 'package:home_decoration_marketplace/app/utils/get_id_key.dart';

class IncreaseQuantityButton extends StatelessWidget {
  final String sku;
  IncreaseQuantityButton({@required this.sku});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<YourCartController>(
      assignId: true,
      id: GetIdKey.QUANTITYBUTTON,
      builder: (controller) {
        return Container(
          height: 30,
          width: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                child: Icon(EvaIcons.minus, size: 15),
                onTap: () {
                  controller.onDecreaseQuantity(sku);
                },
              ),
              SizedBox(width: 10),
              Text(controller.currentQuantity(sku).toString(), style: AppStyles.quantityText),
              SizedBox(width: 10),
              GestureDetector(
                child: Icon(EvaIcons.plus, size: 15),
                onTap: () {
                  controller.onIncreaseQuantity(sku);
                },
              )
            ],
          ),
        );
      },
    );
  }
}
