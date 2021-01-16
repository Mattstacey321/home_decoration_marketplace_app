import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_decoration_marketplace/app/global_widgets/custom_app_bar.dart';
import 'package:home_decoration_marketplace/app/global_widgets/custom_button.dart';
import 'package:home_decoration_marketplace/app/theme/app_color.dart';

class DiscountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          childs: [],
          onTapBack: () => Get.back(),
          homeIcon: Icon(EvaIcons.close),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "SHIPPING TO:",
                            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Edit",
                              style: TextStyle(color: Colors.blue),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Mary R Ashby"),
                          Text("4864  Jerry Toth Drive, US"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(thickness: 1),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "PAYMENT DETAILS:",
                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Edit",
                            style: TextStyle(color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // credit card serial number
                        Text("XXX-XXXX-XXXX-1098"),
                        Icon(EvaIcons.creditCardOutline)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(thickness: 1),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          "DEVIVERY:",
                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        DeliverySelection(
                            title: "Standart (14 days)",
                            description: r'$' "10.00",
                            isSelected: false),
                        DeliverySelection(
                            title: "Express (7 days)",
                            description: r'+$' "20.00",
                            isSelected: true),
                        DeliverySelection(
                            title: "Premium (3 days)",
                            description: r'$' "30.00",
                            isSelected: false),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Divider(thickness: 1),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                height: 50,
                width: Get.width,
                onTap: () {
                  Get.back();
                },
                radius: 0,
                backgroundColor: AppColors.mainColor,
                childs: [
                  Icon(EvaIcons.saveOutline, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeliverySelection extends StatelessWidget {
  final String title;
  final String description;
  final bool isSelected;
  DeliverySelection({this.isSelected = false, this.title, this.description});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: Get.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          isSelected
              ? Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(color: AppColors.mainColor, shape: BoxShape.circle),
                )
              : Container(
                  height: 12,
                  width: 12,
                  decoration:
                      BoxDecoration(color: Colors.grey.withOpacity(0.5), shape: BoxShape.circle),
                ),
          SizedBox(width: 10),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.black : Colors.grey.withOpacity(0.5),
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.black : Colors.grey.withOpacity(0.5),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
