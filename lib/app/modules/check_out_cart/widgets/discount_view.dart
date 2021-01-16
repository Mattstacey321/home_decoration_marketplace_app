import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:home_decoration_marketplace/app/theme/app_color.dart';
import 'package:home_decoration_marketplace/app/utils/upper_case_text_formatter.dart';

class DiscountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.25,
      width: Get.width,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            "Reddem your coupon:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Flexible(
            child: CouponInput(
              controller: TextEditingController(text: "CAFE002"),
            ),
          ),
        ],
      ),
    );
  }
}

class CouponInput extends StatelessWidget {
  final TextEditingController controller;
  CouponInput({this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: Get.width,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: controller,
        inputFormatters: [LengthLimitingTextInputFormatter(8), UpperCaseTextFormatter()],
        style: TextStyle(fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            hintText: "Enter coupon code here",
            hintStyle: TextStyle(color: Colors.grey),
            suffix: Container(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: GestureDetector(
                    onTap: () => Get.back(),
                    behavior: HitTestBehavior.opaque,
                    child: Text("Apply",style: TextStyle(color: AppColors.mainColor),)),
              ),
            )),
      ),
    );
  }
}
