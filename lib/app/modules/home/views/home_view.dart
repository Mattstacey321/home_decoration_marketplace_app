import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_decoration_marketplace/app/global_widgets/bottom_sheet_item.dart';
import 'package:home_decoration_marketplace/app/global_widgets/cirlce_icon.dart';
import 'package:home_decoration_marketplace/app/global_widgets/custom_app_bar.dart';
import 'package:home_decoration_marketplace/app/global_widgets/custom_avatar.dart';
import 'package:home_decoration_marketplace/app/global_widgets/your_bag_button.dart';
import 'package:home_decoration_marketplace/app/modules/home/controllers/home_controller.dart';
import 'package:home_decoration_marketplace/app/modules/home/widgets/categories_view_item.dart';
import 'package:home_decoration_marketplace/app/modules/home/widgets/product_item_view.dart';
import 'package:home_decoration_marketplace/app/modules/home/widgets/tab_bar.dart';
import 'package:home_decoration_marketplace/app/routes/app_pages.dart';
import 'package:home_decoration_marketplace/app/theme/app_color.dart';
import 'package:home_decoration_marketplace/app/theme/app_loading.dart';
import 'package:home_decoration_marketplace/app/theme/app_style.dart';
import 'package:home_decoration_marketplace/app/utils/get_id_key.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<HomeController>(
        assignId: true,
        id: GetIdKey.HOME,
        builder: (controller) => Scaffold(
          appBar: CustomAppBar(
            homeIcon: Icon(EvaIcons.menu2),
            onTapBack: () {},
            childs: [
              Spacer(),
              CircleIcon(onTap: () {}, child: Icon(EvaIcons.bellOutline)),
              CircleIcon(onTap: () {}, child: Icon(EvaIcons.searchOutline)),
              CustomAvatar(
                  onTap: () {
                    Get.bottomSheet(
                        Container(
                          height: 220,
                          width: Get.width,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: Column(
                            children: <Widget>[
                              BottomSheetItem(
                                icon: EvaIcons.shoppingBagOutline,
                                onTap: () {},
                                title: "Your bag",
                              ),
                              BottomSheetItem(
                                icon: EvaIcons.browserOutline,
                                onTap: () {},
                                title: "Payment history",
                              ),
                              BottomSheetItem(
                                icon: EvaIcons.settingsOutline,
                                onTap: () {},
                                title: "Setting",
                              ),
                              BottomSheetItem(
                                icon: EvaIcons.logInOutline,
                                onTap: () {},
                                title: "Log out",
                              ),
                            ],
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
                        backgroundColor: Colors.white);
                  },
                  borderRadius: 15)
            ],
          ),
          // bag
          floatingActionButton: YourBagButton(),
          body: DefaultTabController(
            length: controller.tabViewCount,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    floating: true,
                    pinned: false,
                    expandedHeight: 200,
                    backgroundColor: Colors.white,
                    flexibleSpace: Center(
                      child: controller.categories.isEmpty
                          ? AppLoading.defaultLoading
                          : Column(
                              children: [
                                Flexible(
                                  child: ListView.separated(
                                    separatorBuilder: (context, index) => SizedBox(width: 20),
                                    itemCount: controller.categories.length,
                                    scrollDirection: Axis.horizontal,
                                    padding: EdgeInsets.all(20),
                                    itemBuilder: (context, index) {
                                      final categories = controller.categories;
                                      String imagePath = categories[index].imagePath;
                                      String title = categories[index].title;
                                      return CategorViewyItem(
                                        height: 100,
                                        width: Get.width - 150,
                                        image: imagePath,
                                        title: title,
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 40)
                              ],
                            ),
                    ),
                    //tabbar
                    bottom: MyTabBar()
                  ),
                ];
              },
              body: TabBarView(
                controller: controller.tabController,
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Have ${controller.totalProduct} products",
                                style: AppStyles.totalProductHomeView,
                              ),
                              DropdownButtonHideUnderline(
                                  child: Container(
                                height: 40,
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                    color: AppColors.main100,
                                    borderRadius: BorderRadius.circular(10)),
                                child: DropdownButton<String>(
                                  items: controller.sort.map((String val) {
                                    return DropdownMenuItem<String>(
                                      value: val,
                                      child: Row(
                                        children: <Widget>[
                                          Text(val),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                  hint: Text("Sort by"),
                                  onChanged: (value) {},
                                ),
                              ))
                            ],
                          ),
                          SizedBox(height:10),
                          Flexible(
                            child: GridView.builder(
                              itemCount: controller.totalProduct,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 15,
                                childAspectRatio: (200 / 300),
                              ),
                              itemBuilder: (context, index) {
                                String sku = controller.productList[index].sku;
                                return ProductItemView(
                                  onTap: () {
                                    Get.toNamed(Routes.PRODUCT_DETAIL, arguments: sku);
                                  },
                                  product: controller.productList[index],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: GridView.builder(
                      padding: EdgeInsets.all(20),
                      itemCount: controller.totalProduct,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: (200 / 400),
                      ),
                      itemBuilder: (context, index) {
                        return ProductItemView(
                          onTap: () {},
                          product: controller.productList[index],
                        );
                      },
                    ),
                  ),
                  Container(
                    child: GridView.builder(
                      padding: EdgeInsets.all(20),
                      itemCount: controller.totalProduct,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        childAspectRatio: (200 / 300),
                      ),
                      itemBuilder: (context, index) {
                        return ProductItemView(
                          onTap: () {},
                          product: controller.productList[index],
                        );
                      },
                    ),
                  ),
                  Container(
                    child: GridView.builder(
                      padding: EdgeInsets.all(20),
                      itemCount: controller.totalProduct,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: (200 / 400),
                      ),
                      itemBuilder: (context, index) {
                        return ProductItemView(
                          onTap: () {},
                          product: controller.productList[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
