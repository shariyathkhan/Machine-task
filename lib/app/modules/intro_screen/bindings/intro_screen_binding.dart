import 'package:get/get.dart';

import 'package:currencyapp/app/modules/intro_screen/controllers/intro_screen_controller.dart';

class IntroScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroScreenController>(() => IntroScreenController());
  }
}
