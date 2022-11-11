import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:vimigo/module/notfound/notfound_page.dart';
import 'package:vimigo/widget/base_loading_indicator.dart';

import 'app/app_constant.dart';
import 'app/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      title: "Vimigo",
      scrollBehavior: AppScrollBehavior(),
      // translationsKeys: AppTranslation.translations,
      // locale: LocaleHelper.getCurrentLocale().locale,
      defaultTransition:
          kIsWeb ? Transition.noTransition : Transition.cupertino,
      theme: ThemeData(
        brightness: Brightness.light,
        splashColor: Colors.transparent,
        hoverColor: const Color(0x07000000),
        highlightColor: const Color(0x1A000000),
        // dividerColor: Colors.transparent,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        splashColor: Colors.transparent,
        hoverColor: const Color(0x07FFFFFF),
        highlightColor: const Color(0x1AFFFFFF),
        // dividerColor: Colors.transparent,
      ),
      // themeMode: ThemeHelper.getCurrentThemeMode(),
      initialRoute: RouteName.dashboard,
      getPages: AppPages.routes,
      unknownRoute:
          GetPage(name: RouteName.notfound, page: () => NotfoundPage()),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: LoaderOverlay(
              useDefaultLoading: false,
              overlayWidget: const BaseLoadingIndicator(),
              child: child!,
            ));
      },
    );
  }
}

class AppScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
