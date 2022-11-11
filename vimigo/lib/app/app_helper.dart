import 'package:flutter/cupertino.dart';

class AppHelper {
  static restartApp() {
    // AppController appController = Get.find();
    // appController.navigateToRootPage();
  }

  static bool isHideKeyboard(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom == 0;
  }

  static hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
