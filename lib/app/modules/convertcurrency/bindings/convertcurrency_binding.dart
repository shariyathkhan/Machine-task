import 'package:get/get.dart';

import '../controllers/convertcurrency_controller.dart';

class ConvertcurrencyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConvertcurrencyController>(
      () => ConvertcurrencyController(),
    );
  }
}
