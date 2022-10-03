import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:currencyapp/app/util/colors.dart';
import 'package:currencyapp/app/util/constants.dart';


import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetWidget<SplashscreenController> {
  const SplashscreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Image.asset(
            Constants.qbFoodWhiteIcon,
            width: Get.width * 0.65,
          ),
        ),
      ),
    );
  }
}
