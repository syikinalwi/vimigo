import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../app/app_constant.dart';
import '../app/app_helper.dart';

class BaseScreen extends StatelessWidget {
  final bool safeAreaTop;
  final bool safeAreaBottom;
  final Color safeAreaBottomColor;
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Color? backgroundColor;
  final String? backgroundImage;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Widget? endDrawer;
  final SystemUiOverlayStyle statusBarTheme;
  const BaseScreen({
    Key? key,
    this.safeAreaTop = true,
    this.safeAreaBottom = true,
    this.appBar,
    required this.body,
    this.backgroundColor,
    this.backgroundImage,
    this.bottomNavigationBar,
    this.drawer,
    this.endDrawer,
    this.statusBarTheme = SystemUiOverlayStyle.dark,
    this.safeAreaBottomColor = Colors.transparent,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          backgroundImage ?? 'assets/images/logo.jpg',
          width: Get.width,
          height: Get.height,
          fit: BoxFit.cover,
        ),
        GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: AnnotatedRegion<SystemUiOverlayStyle>(
              value: statusBarTheme,
              child: Title(
                title: "xxApp Name", //LocalizationKey.app_name.tr,
                color: Colors.black, //Get.context!.colorThemeDark,
                child: Scaffold(
                  backgroundColor: backgroundColor ??
                      Colors.grey.shade300, //context.colorMainBg,
                  appBar: appBar,
                  drawer: drawer,
                  endDrawer: endDrawer,
                  body: Stack(
                    children: [
                      SafeArea(
                        top: safeAreaTop,
                        bottom: safeAreaBottom,
                        child: body,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          color: safeAreaBottomColor,
                          height: AppHelper.isHideKeyboard(context)
                              ? safeAreaBottomHeight
                              : 0,
                        ),
                      ),
                    ],
                  ),
                  bottomNavigationBar: bottomNavigationBar,
                ),
              ),
            )),
      ],
    );
  }
}
