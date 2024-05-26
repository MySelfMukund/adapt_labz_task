import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_album_controller.dart';

class MyAlbumView extends GetView<MyAlbumController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyAlbumView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MyAlbumView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
