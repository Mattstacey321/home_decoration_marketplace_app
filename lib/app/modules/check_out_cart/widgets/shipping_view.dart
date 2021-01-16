import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_decoration_marketplace/app/global_widgets/custom_app_bar.dart';
import 'package:home_decoration_marketplace/app/global_widgets/custom_button.dart';
import 'package:home_decoration_marketplace/app/theme/app_color.dart';

class ShippingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          childs: [],
          homeIcon: Icon(EvaIcons.close),
          onTapBack: () => Get.back(),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Container(
                height: Get.height - 100,
                width: Get.width,
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "CONTACT DETAILS",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                            InputContainer(title: "First Name"),
                            InputContainer(title: "Last Name"),
                            InputContainer(title: "Email"),
                            InputContainer(title: "Phone")
                          ],
                        ),
                      ),
                    ),
                    Divider(thickness: 1),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "SHIPPING ADDRESS",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                            InputContainer(title: "Country"),
                            InputContainer(title: "State"),
                            InputContainer(title: "City"),
                            InputContainer(title: "Zip Code")
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomButton(
                        height: 50,
                        width: Get.width,
                        onTap: () {},
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
            ),
          ),
        ),
      ),
    );
  }
}

class InputContainer extends StatelessWidget {
  final String title;
  InputContainer({this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey.withOpacity(0.2), width: 2)),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Text(
              title,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Expanded(
            flex: 6,
            child: TextField(
              decoration: InputDecoration.collapsed(hintText: ""),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
