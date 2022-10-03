import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../../../util/constants.dart';
import '../model/changerate_model.dart';

class ChangeRateProvider extends GetConnect {
  Future<ChangeRateModel> getList() async {
    var url = dotenv.env[Constants.mainBaseUrl].toString() +
        '${Constants.apiKeys}/${Constants.latestAPI}/${Constants.USD}';
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.status);
    } else {
      return ChangeRateModel.fromJson(response.body);
    }
  }
}
