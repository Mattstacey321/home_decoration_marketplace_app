import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:home_decoration_marketplace/app/global_widgets/custom_app_bar.dart';
import 'package:home_decoration_marketplace/app/modules/home/controllers/home_controller.dart';

class MyTabBar extends GetView<HomeController> implements PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      childs: [],
      tabBar: Container(
        height: 40,
        width: Get.width,
        padding: EdgeInsets.only(left: 20),
        child: Theme(
          data: ThemeData(highlightColor: Colors.transparent, splashColor: Colors.transparent),
          child: TabBar(
            isScrollable: true,
            controller: controller.tabController,
            onTap: (value) {},
            tabs: controller.tabView
                .map((label) => Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: Tab(
                        child: Container(
                          height: 60,
                          width: 80,
                          alignment: Alignment.center,
                          child: Text("$label"),
                        ),
                      ),
                    ))
                .toList(),
            unselectedLabelColor: Colors.grey,
            indicator:
                BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.green[300]),
            labelColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            indicatorColor: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
