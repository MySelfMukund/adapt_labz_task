import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:problem_statement/app/modules/home_page/models/photos_model.dart';
import 'package:problem_statement/app/modules/my_album/models/album_model.dart';

import '../../../data/services/dio_service_handler.dart';

class MyAlbumProvider extends GetConnect {
  @override
  void onInit() {
    // httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<List<AlbumModel>?> getMyAlbumsData() async {
    try {
      String endPoint = 'albums';
      String params = "?userId=1";
      var response = await dio.get(endPoint + params);
      if (response.statusCode == 200) {
        var albumModel = albumModelFromJson(json.encode(response.data));
        return albumModel;
      } else {
        Get.snackbar('Error', 'Unable to get Profile details due to : ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print("Unable to get Profile data : ${e.toString()}");
      }
    }
    return null;
  }

  Future<List<PhotosModel>?> getPhotosList(int albumId) async {
    try {
      String endPoint = 'photos';
      String params = "?albumId=$albumId";
      var response = await dio.get(endPoint + params);
      if (response.statusCode == 200) {
        var photosList = photosModelFromJson(json.encode(response.data));
        return photosList;
      } else {
        Get.snackbar('Error', 'Unable to get Profile details due to : ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print("Unable to get Profile data : ${e.toString()}");
      }
    }
    return null;
  }
}
