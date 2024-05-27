import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:problem_statement/app/routes/app_pages.dart';

import '../../home_page/views/home_page_view.dart';
import '../../my_album/views/my_album_view.dart';
import '../../my_posts/views/my_posts_view.dart';
import '../controllers/home_navigation_controller.dart';

class HomeNavigationView extends GetView<HomeNavigationController> {
  const HomeNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }
        if (controller.currentTabIndex == 0) {
          final bool shouldPop = await showExitPopup() ?? false;
          if (context.mounted && shouldPop) {
            Navigator.pop(context);
          }
        } else {
          controller.currentTabIndex = 0;
        }
        return Future.value(false);
      },
      child: Scaffold(
        body: Obx(
          () => IndexedStack(
            index: controller.currentTabIndex,
            children: [HomePageView(), MyAlbumView(), MyPostsView()],
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.stacked_line_chart_sharp), label: 'Albums'),
              BottomNavigationBarItem(icon: Icon(Icons.select_all_outlined), label: 'Posts')
            ],
            currentIndex: controller.currentTabIndex,
            selectedItemColor: Colors.red,
            onTap: controller.onTabChange,
          ),
        ),
      ),
    );
  }

  Future<bool?> showExitPopup() async {
    return await showDialog<bool>(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            title: const Text("Adept Labz"),
            content: const Text("Do you want to quit the app?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text("No")),
              TextButton(
                  onPressed: () {
                    exit(0);
                    // SystemNavigator.pop();
                    // Navigator.of(context).pop(true);
                  },
                  child: const Text("Yes")),
            ],
          );
        });
  }
}
