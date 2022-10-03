import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:currencyapp/app/util/check_network.dart';

import 'package:currencyapp/app/util/colors.dart';
import 'package:currencyapp/app/util/constants.dart';
import '../../../routes/app_pages.dart';
import '../../../util/colors.dart';
import '../providers/changerate_provider.dart';

class CountrycurrencyController extends GetxController with StateMixin {
  //TODO: Implement CountrycurrencyController

  final count = 0.obs;

  final currencyName = [].obs;
  final currencyData = [].obs;
  final storeCurrencyData = [].obs;

  @override
  void onInit() {
    print("resp.result");
    super.onInit();
    callAPI();
  }

  void callAPI() async {
    ChangeRateProvider().getList().then((resp) {
      change(value, status: RxStatus.success());

      if (resp.result == Constants.success) {
        resp.conversionRates!.forEach((key, value) {
          Map changeRate = {};
          changeRate["name"] = key;
          changeRate["value"] = value;
          changeRate["status"] = "0";
          currencyName.add(changeRate);
          currencyData.add(value);
        });
      }
    });
    
  }

  networkCheck() async {
    if (await CheckNetwork.checkNetwork() == true) {
      callAPI();
    } else {
      change(null, status: RxStatus.error());
    }
  }

  void selectedCurrency(index) async {
    if (storeCurrencyData.length <= 1) {
      if (currencyName[index]["status"].toString() == "1") {
        currencyName[index]["status"] = "0";
        storeCurrencyData.removeAt(0);
      } else {
        storeCurrencyData.add(currencyName[index]);
        currencyName[index]["status"] = "1";
      }
    } else {
      if (currencyName[index]["status"].toString() == "1") {
        currencyName[index]["status"] = "0";
        storeCurrencyData.removeAt(0);
      } else {
        for (var element in currencyName) {
          if (element["name"] == storeCurrencyData[0]['name']) {
            element["status"] = "0";
          }
        }
        storeCurrencyData.removeAt(0);

        storeCurrencyData.add(currencyName[index]);
        currencyName[index]["status"] = "1";
      }
    }
  }

  submitAction() async {
    print("object");

    if (storeCurrencyData.length == 2) {
      //Get.toNamed(Routes.CONVERTCURRENCY);
      Get.toNamed(Routes.CONVERTCURRENCY, arguments: [storeCurrencyData]);
    } else {
      callSnackBar("Please, Select two country currency", false);
    }
  }

  void callSnackBar(String message, bool isSuccess) {
    Get.snackbar("", "",
        colorText: Colors.white,
        titleText: Container(),
        messageText: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            isSuccess
                ? Image.asset("assets/images/check_icon.png",
                    color: AppColors.white, width: 15, height: 15)
                : const Icon(
                    Icons.close,
                    color: AppColors.white,
                  ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  message,
                  style: Get.textTheme.headline4?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                      letterSpacing: 0),
                ),
              ),
            ),
          ],
        ),
        borderRadius: 0.0,
        margin: EdgeInsets.all(10),
        backgroundColor: isSuccess ? AppColors.snackBarColor : AppColors.red,
        snackPosition: SnackPosition.BOTTOM);
  }
}
