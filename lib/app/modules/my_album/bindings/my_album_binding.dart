import 'package:get/get.dart';

import '../controllers/my_album_controller.dart';

class MyAlbumBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyAlbumController>(
      () => MyAlbumController(),
    );
  }
}
