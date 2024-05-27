import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_album_controller.dart';

class MyAlbumView extends StatelessWidget {
  //GetView<MyAlbumController> {
  final controller = Get.isRegistered<MyAlbumController>()
      ? Get.find<MyAlbumController>()
      : Get.put(MyAlbumController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyAlbumView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MyAlbumView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
