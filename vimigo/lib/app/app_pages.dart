import 'package:get/get.dart';
import 'package:vimigo/app/app_constant.dart';
import 'package:vimigo/module/dashboard/dashboard_bindings.dart';
import 'package:vimigo/module/dashboard/dashboard_page.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(
        name: RouteName.dashboard,
        page: () => DashboardPage(),
        binding: DashboardBindings())
  ];
}
