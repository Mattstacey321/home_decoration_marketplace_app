import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_decoration_marketplace/app/data/services/product_services.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(
    NotificationListener(
      onNotification: (OverscrollIndicatorNotification overScroll) {
        overScroll.disallowGlow();
        return false;
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Home Decoration",
        builder: BotToastInit(), 
        navigatorObservers: [BotToastNavigatorObserver()],
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    ),
  );
}
