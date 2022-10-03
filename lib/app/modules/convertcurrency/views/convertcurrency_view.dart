import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:currencyapp/app/util/colors.dart';
import 'package:currencyapp/app/util/constants.dart';

import '../controllers/convertcurrency_controller.dart';

class ConvertcurrencyView extends GetView<ConvertcurrencyController> {
  final ConvertcurrencyController controller =
      Get.put(ConvertcurrencyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.accentColor,
          title: Text('Convert currency'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: _buildBody(),
              )
            ],
          ),
        ));
  }

  _buildBody() {
    return Obx(() {
      return SingleChildScrollView(
          child: Container(
        color: AppColors.white,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Image.asset(
                        '${"assets/icons/flags/png/"}${controller.currencyName0.toString().substring(0, 2).toLowerCase()}${".png"}',
                        height: 50,
                        width: 50,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      controller.isLeftEdit.value
                          ? _buildEditConvertCurrency0()
                          : _buildConvertCurrency0(),
                      SizedBox(
                        height: 6,
                      ),
                      _buildCurrencyName0(),
                    ],
                  ),
                ),
                Icon(
                  Icons.loop,
                  size: 32,
                  color: AppColors.accentColor,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image.asset(
                        '${"assets/icons/flags/png/"}${controller.currencyName1.toString().substring(0, 2).toLowerCase()}${".png"}',
                        height: 50,
                        width: 50,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      controller.isRightEdit.value
                          ? _buildEditConvertCurrency1()
                          : _buildConvertCurrency1(),
                      SizedBox(
                        height: 6,
                      ),
                      _buildCurrencyName1(),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Text(Constants.history,
                style: Theme.of(Get.context!)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 18, color: AppColors.black)),
            SizedBox(
              height: 16,
            ),
            Container(
              width: Get.width,
              child: Text(Constants.noRecords,
                  textAlign: TextAlign.center,
                  style: Theme.of(Get.context!)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 16, color: AppColors.red)),
            )
          ],
        ),
      ));
    });
  }

  _buildCurrencyName0() {
    return Text(controller.currencyName0.toString(),
        style: Theme.of(Get.context!)
            .textTheme
            .headline6!
            .copyWith(fontSize: 16, color: AppColors.black));
  }

  _buildConvertCurrency0() {
    return GestureDetector(
        onTap: () {
          controller.isLeftEdit.value = true;
          controller.isRightEdit.value = false;
        },
        child: Container(
            width: Get.width,
            height: 48,
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.grayText, width: 2),
            ),
            child: Text(controller.currencyValueEdit0.toString(),
                style: Theme.of(Get.context!)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 16, color: AppColors.black))));
  }

  _buildEditConvertCurrency0() {
    return Container(
      width: Get.width,
      height: 48,
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.grayText, width: 2),
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        autofocus: true,
        controller: controller.leftCurrencyController,
        focusNode: controller.leftFocusNode,
        style: TextStyle(fontSize: 22.0, color: AppColors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: '0',
          contentPadding: const EdgeInsets.only(left: 0, bottom: 0, top: 0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        onChanged: (value) {
          controller.convertToCurrency(value.toString());
        },
      ),
    );
  }

  _buildEditConvertCurrency1() {
    return Container(
      width: Get.width,
      height: 48,
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.grayText, width: 2),
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        autofocus: true,
        controller: controller.rightCurrencyController,
        focusNode: controller.rightFocusNode,
        style: TextStyle(fontSize: 22.0, color: AppColors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: '0',
          contentPadding: const EdgeInsets.only(left: 0, bottom: 0, top: 0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        onChanged: (value) {
          controller.convertToCurrency(value.toString());
        },
      ),
    );
  }
  //

  _buildCurrencyName1() {
    return Text(controller.currencyName1.toString(),
        style: Theme.of(Get.context!)
            .textTheme
            .headline6!
            .copyWith(fontSize: 16, color: AppColors.black));
    ;
  }

  _buildConvertCurrency1() {
    return GestureDetector(
        onTap: () {
          controller.isLeftEdit.value = false;
          controller.isRightEdit.value = true;
        },
        child: Container(
            width: Get.width,
            height: 48,
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.white,
              //color: AppColors.grey.withOpacity(0.25),

              border: Border.all(color: AppColors.grayText, width: 2),
            ),
            child: Text(controller.currencyValueEdit1.toString(),
                style: Theme.of(Get.context!)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 16, color: AppColors.black))));
  }
}
