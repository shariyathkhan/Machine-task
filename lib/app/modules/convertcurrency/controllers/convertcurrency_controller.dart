import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:currencyapp/app/modules/countrycurrency/controllers/countrycurrency_controller.dart';

class ConvertcurrencyController extends GetxController {
  //TODO: Implement ConvertcurrencyController

  final count = 0.obs;
  final currencyName0 = "USD".obs;
  final currencyName1 = "AED".obs;
  final currencyValue0 = "1".obs;
  final currencyValue1 = "3.6725".obs;
  final currencyValueEdit0 = "0".obs;
  final currencyValueEdit1 = "0".obs;
  final isLeftEdit = false.obs;
  final isRightEdit = false.obs;
  TextEditingController leftCurrencyController = TextEditingController();
  TextEditingController rightCurrencyController = TextEditingController();
  FocusNode leftFocusNode = FocusNode();
  FocusNode rightFocusNode = FocusNode();
  final countryCodes = "af";

  @override
  void onInit() {
    super.onInit();

    for (int i = 0;
        i < Get.find<CountrycurrencyController>().storeCurrencyData.length;
        i++) {
      if (i == 0) {
        Get.find<CountrycurrencyController>().currencyName.forEach((element) {
          if (element["name"].toString() ==
              Get.find<CountrycurrencyController>()
                  .storeCurrencyData[i]['name']
                  .toString()) {
            currencyName0.value = element["name"].toString();
            currencyValue0.value = element["value"].toString();
            currencyValueEdit0.value = element["value"].toString();
          }
        });
      }
      if (i == 1) {
        Get.find<CountrycurrencyController>().currencyName.forEach((element) {
          if (element["name"] ==
              Get.find<CountrycurrencyController>().storeCurrencyData[i]
                  ['name']) {
            currencyName1.value = element["name"].toString();
            currencyValue1.value = element["value"].toString();
            currencyValueEdit1.value = element["value"].toString();
          }
        });
      }
    }
  }

  convertToCurrency(value) async {
    if (isLeftEdit.value == true) {
      if (double.parse(currencyValue0.value) <
          double.parse(currencyValue1.value)) {
        final convertValue =
            double.parse(value) * double.parse(currencyValue1.value);

        currencyValueEdit1.value = convertValue.toStringAsFixed(2);
      } else {
        final convertValue =
            double.parse(value) / double.parse(currencyValue0.value);

        currencyValueEdit1.value = convertValue.toStringAsFixed(2);
      }
    } else {
      if (double.parse(currencyValue1.value) <
          double.parse(currencyValue0.value)) {
        final convertValue =
            double.parse(value) * double.parse(currencyValue0.value);
        currencyValueEdit0.value = convertValue.toStringAsFixed(2);
      } else {
        final convertValue =
            double.parse(value) / double.parse(currencyValue1.value);

        currencyValueEdit0.value = convertValue.toStringAsFixed(2);
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
