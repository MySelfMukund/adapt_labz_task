import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:problem_statement/app/modules/my_album/models/album_model.dart';
import 'package:problem_statement/app/modules/my_album/providers/my_album_provider.dart';

import '../../home_page/models/photos_model.dart';

class MyAlbumController extends GetxController {
  MyAlbumProvider provider = Get.isRegistered<MyAlbumProvider>() ? Get.find<MyAlbumProvider>() : Get.put(MyAlbumProvider());
  var isLoading = false.obs;
  RxList<AlbumModel> albumList = <AlbumModel>[].obs;
  RxList<PhotosModel> photosList = <PhotosModel>[].obs;
  @override
  Future<void> onInit() async {
    await getAlbumList();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> getAlbumList() async {
    try {
      isLoading.value = true;
      var result = await provider.getMyAlbumsData();
      if (result != null) {
        albumList.value = result;
        albumList.refresh();
      }
    } catch (e) {
      if (kDebugMode) {
        print("Profile details catch error ${e.toString()}");
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getPhotoListFromAlbumId(int albumId) async {
    try {
      isLoading.value = true;
      var result = await provider.getPhotosList(albumId);
      if (result != null) {
        photosList.value = result;
        photosList.refresh();
      }
    } catch (e) {
      if (kDebugMode) {
        print("Profile details catch error ${e.toString()}");
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> albumListTileClick(int albumId) async {
    await getPhotoListFromAlbumId(albumId);
  }
}
