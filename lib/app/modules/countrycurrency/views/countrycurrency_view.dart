import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:currencyapp/app/modules/countrycurrency/controllers/countrycurrency_controller.dart';
import 'package:currencyapp/app/util/check_network.dart';
import 'package:currencyapp/app/util/colors.dart';
import 'package:currencyapp/app/util/constants.dart';

import '../../../common_widgets/views/commonwidget.dart';
import '../controllers/countrycurrency_controller.dart';

class CountrycurrencyView extends GetView<CountrycurrencyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.accentColor,
          title: Text('Country currency'),
          centerTitle: true,
        ),
        body: controller.obx((state) {
          return Container(
            color: AppColors.dialogBG,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _showCurrencyList(),
                Container(
                    width: Get.width,
                    margin: EdgeInsets.symmetric(vertical: 1),
                    color: AppColors.accentColor,
                    child: ElevatedButton(
                      onPressed: () {
                        //  Get.back();
                        controller.submitAction();
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          primary: AppColors.accentColor),
                      child: Text(Constants.submit,
                          style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                    ))
              ],
            ),
          );
        },
            onLoading: const ReconnectingOverlay(),
            // ignore: sized_box_for_whitespace
            onError: (error) => Container(
                height: Get.height,
                width: Get.width,
                child: CheckNetwork.containerForNoInternet(
                    Get.width, Get.height, controller.networkCheck))));
  }

  _showCurrencyList() => Expanded(
          child: ListView.builder(
        itemCount: controller.currencyName.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                controller.selectedCurrency(index);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16.0),
                margin: EdgeInsets.symmetric(vertical: 1),
                color: AppColors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            controller.currencyName[index]['name']
                                            .toString()
                                            .substring(0, 2)
                                            .toString()
                                            .toLowerCase() ==
                                        "xa" ||
                                    controller.currencyName[index]['name']
                                            .toString()
                                            .substring(0, 2)
                                            .toString()
                                            .toLowerCase() ==
                                        "xc" ||
                                    controller.currencyName[index]['name']
                                            .toString()
                                            .substring(0, 2)
                                            .toString()
                                            .toLowerCase() ==
                                        "xd" ||
                                    controller.currencyName[index]['name']
                                            .toString()
                                            .substring(0, 2)
                                            .toString()
                                            .toLowerCase() ==
                                        "xo" ||
                                    controller.currencyName[index]['name']
                                            .toString()
                                            .substring(0, 2)
                                            .toString()
                                            .toLowerCase() ==
                                        "xp"
                                ? Image.asset(
                                    '${"assets/icons/flags/png/"}${"xk"}${".png"}',
                                    height: 50,
                                    width: 50,
                                  )
                                : Image.asset(
                                    '${"assets/icons/flags/png/"}${controller.currencyName[index]['name'].toString().substring(0, 2).toString().toLowerCase()}${".png"}',
                                    height: 50,
                                    width: 50,
                                  ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                                controller.currencyName[index]['name']
                                    .toString(),
                                style: Theme.of(Get.context!)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        fontSize: 16, color: AppColors.black)),
                          ],
                        ),
                        Row(
                          children: [
                            Text(controller.currencyData[index].toString(),
                                style: Theme.of(Get.context!)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        fontSize: 16, color: AppColors.black)),
                            SizedBox(
                              width: 6,
                            ),
                            _buildSelectedIcons(index)
                          ],
                        )
                      ],
                    )
                    // Obx(
                    //   () => _buildMenuRowItems(
                    //       controller.categoryList[index].displayText!, index),
                    // ),
                  ],
                ),
              ));
        },
      ));

  _buildSelectedIcons(index) {
    return Obx(() {
      return controller.storeCurrencyData.isNotEmpty
          ? controller.currencyName[index]['status'] == "1" // currencyName
              ? Icon(Icons.check, color: AppColors.accentColor)
              : Container()
          : Container();
    });
  }
}
