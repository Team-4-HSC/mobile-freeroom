import 'package:get/get.dart';

import 'package:freeroom/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:freeroom/app/modules/dashboard/views/dashboard_view.dart';
import 'package:freeroom/app/modules/home/bindings/home_binding.dart';
import 'package:freeroom/app/modules/home/views/home_view.dart';
import 'package:freeroom/app/modules/login/bindings/login_binding.dart';
import 'package:freeroom/app/modules/login/views/login_view.dart';
import 'package:freeroom/app/modules/profile/bindings/profile_binding.dart';
import 'package:freeroom/app/modules/profile/views/profile_view.dart';
import 'package:freeroom/app/modules/search/bindings/search_binding.dart';
import 'package:freeroom/app/modules/search/views/search_view.dart';
import 'package:freeroom/app/modules/splash_screen/bindings/splash_screen_binding.dart';
import 'package:freeroom/app/modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
