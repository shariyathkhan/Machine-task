import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  GetStorage.init();

//WidgetsBinding.instance!.addObserver(LifeCycleListener(list));
  runApp(ScreenUtilInit(
    designSize: Size(360, 690), // widget
    builder: (context, widget) => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      //theme: AppThemeData.themeData,
    ),
  ));
}
