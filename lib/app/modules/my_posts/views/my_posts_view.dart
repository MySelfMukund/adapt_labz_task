import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_posts_controller.dart';

class MyPostsView extends GetView<MyPostsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyPostsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MyPostsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
