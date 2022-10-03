import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:currencyapp/app/util/colors.dart';
import 'package:get/get.dart';

import 'package:currencyapp/app/util/colors.dart';

class CheckNetwork {
  static RxBool isClicked = false.obs;
  static Future checkNetwork() async {
    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  static void containerForNoInternetPopUp(
          double screenWidth, double screenHeight, Function callBackFn) =>
      Get.dialog(Scaffold(
        body: containerForNoInternet(screenWidth, screenHeight, () {
          callBackFn();
          Get.back();
        }),
      ));

  static Widget containerForNoInternet(
          double screenWidth, double screenHeight, Function callBackFn) =>
      Container(
        width: Get.width,
        color: AppColors.white,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/no.png",
              width: screenWidth * 0.3,
              height: screenHeight * 0.1,
              color: AppColors.primaryColor.withOpacity(0.6),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5, right: 5, top: 15),
              child: Text(
                "Network Error!",
                style: TextStyle(
                  color: AppColors.primaryColor.withOpacity(0.7),
                  fontSize: 22,
                  fontFamily: "AN",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, left: 5, right: 5),
              child: Text(
                "Something went wrong,\nPlease try again.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.grayText.withOpacity(0.8),
                  fontSize: 15,
                  fontFamily: "AN",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: IconButton(
                onPressed: () {
                  isClicked.value = true;
                  Timer(Duration(seconds: 2), () {
                    isClicked.value = false;
                  });
                  callBackFn();
                },
                icon: Obx(
                  () => Container(
                      width: 50,
                      height: 50,
                      padding: isClicked.value ? EdgeInsets.all(5) : null,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: isClicked.value
                              ? AppColors.white
                              : AppColors.primaryColor.withOpacity(0.6),
                          shape: BoxShape.circle),
                      child: isClicked.value
                          ? CircularProgressIndicator(
                              strokeWidth: 3,
                              color: AppColors.primaryColor.withOpacity(0.6),
                            )
                          : Icon(
                              Icons.replay,
                              color: AppColors.white,
                              size: 25,
                            )),
                ),
              ),
            ),
          ],
        ),
      );
}
