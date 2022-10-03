import 'dart:async';

import 'package:get/get.dart';
import 'package:currencyapp/app/routes/app_pages.dart';

class IntroScreenController extends GetxController with StateMixin {
  @override
  void onInit() {
    getHomeScreen();
    super.onInit();
  }

  void getHomeScreen() async {
    await Get.offNamed(Routes.COUNTRYCURRENCY);
  }
}
