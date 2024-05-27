import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_posts_controller.dart';

class MyPostsView extends StatelessWidget {
  final controller = Get.isRegistered<MyPostsController>()
      ? Get.find<MyPostsController>()
      : Get.put(MyPostsController());

  MyPostsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyPostsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MyPostsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
