import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

const double defaultAppBarHeight = 50;
const double gap = 15;
double safeAreaTopHeight = MediaQuery.of(Get.context!).padding.top;
double safeAreaBottomHeight = MediaQuery.of(Get.context!).padding.bottom;
double safeAreaHeight = Get.height - safeAreaTopHeight - safeAreaBottomHeight;
double bottomNavigationBarHeight = 50;

class RouteName {
  static String notfound = "/not-found";
  static String dashboard = "/dashboard";
}
