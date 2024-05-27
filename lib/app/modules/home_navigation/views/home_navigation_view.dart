import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:problem_statement/app/modules/home_page/views/home_page_view.dart';
import 'package:problem_statement/app/modules/my_album/views/my_album_view.dart';
import 'package:problem_statement/app/modules/my_posts/views/my_posts_view.dart';
import 'package:problem_statement/app/routes/app_pages.dart';

import '../controllers/home_navigation_controller.dart';

class HomeNavigationView extends GetView<HomeNavigationController> {
  const HomeNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: Routes.HOME_PAGE,
        onGenerateRoute: controller.onGenerateRoute,
      ),

      // body: IndexedStack(
      //   index: controller.currentTabIndex,
      //   children: [HomePageView(), MyAlbumView(), MyPostsView()],
      // ),
      // bottomNavigationBar: Obx(
      //   () => BottomNavigationBar(
      //     items: const <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.stacked_line_chart_sharp), label: 'Albums'),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.select_all_outlined), label: 'Posts')
      //     ],
      //     currentIndex: controller.currentTabIndex,
      //     selectedItemColor: Colors.red,
      //     onTap: controller.onTabChange,
      //   ),
      // ),
    );
  }
}
