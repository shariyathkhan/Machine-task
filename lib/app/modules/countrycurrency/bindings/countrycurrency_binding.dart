import 'package:get/get.dart';

import '../controllers/countrycurrency_controller.dart';

class CountrycurrencyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CountrycurrencyController>(
      () => CountrycurrencyController(),
    );
  }
}
