import 'package:get/get.dart';
import 'package:currencyapp/app/modules/intro_screen/bindings/intro_screen_binding.dart';
import 'package:currencyapp/app/modules/intro_screen/views/intro_screen_view.dart';

import '../modules/convertcurrency/bindings/convertcurrency_binding.dart';
import '../modules/convertcurrency/views/convertcurrency_view.dart';
import '../modules/countrycurrency/bindings/countrycurrency_binding.dart';
import '../modules/countrycurrency/views/countrycurrency_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.COUNTRYCURRENCY;

  // static const initial = Routes.donations;

  static final routes = [
    GetPage(
      name: _Paths.introscreen,
      page: () => IntroScreenViews(),
      binding: IntroScreenBinding(),
    ),
    GetPage(
      name: _Paths.splashscreen,
      page: () => const SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.COUNTRYCURRENCY,
      page: () => CountrycurrencyView(),
      binding: CountrycurrencyBinding(),
    ),
    GetPage(
      name: _Paths.CONVERTCURRENCY,
      page: () => ConvertcurrencyView(),
      binding: ConvertcurrencyBinding(),
    ),
  ];
}
