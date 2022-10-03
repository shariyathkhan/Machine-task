import 'package:get/get.dart';
import 'package:currencyapp/app/routes/app_pages.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    getHomeScreen();
    super.onInit();
  }

  void getHomeScreen() async {
    await Get.offNamed(Routes.COUNTRYCURRENCY);
  }
}
