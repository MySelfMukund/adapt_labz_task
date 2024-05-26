import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../data/constants/global.dart';
import '../../../data/services/dio_service_handler.dart';
import '../models/profile_model.dart';

class HomePageProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = baseApiUrl;
  }

  Future<ProfileModel?>? getProfileData() async {
    try {
      String endPoint = 'users';
      String params = "?id=1";
      var response = await dio.get(endPoint + params);
      if (response.statusCode == 200) {
        ProfileModel profileModel =
            profileModelFromJson(json.encode(response.data))[0];
        return profileModel;
      } else {
        Get.snackbar('Error',
            'Unable to get Profile details due to : ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print("Unable to get Profile data : ${e.toString()}");
      }
    }
    return null;
  }
}
