import 'package:get/get.dart';
import 'package:problem_statement/app/modules/home/views/home_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home_page/bindings/home_page_binding.dart';
import '../modules/home_page/views/home_page_view.dart';
import '../modules/my_album/bindings/my_album_binding.dart';
import '../modules/my_album/views/my_album_view.dart';
import '../modules/my_posts/bindings/my_posts_binding.dart';
import '../modules/my_posts/views/my_posts_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => const HomePageView(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: _Paths.MY_ALBUM,
      page: () => MyAlbumView(),
      binding: MyAlbumBinding(),
    ),
    GetPage(
      name: _Paths.MY_POSTS,
      page: () => MyPostsView(),
      binding: MyPostsBinding(),
    ),
  ];
}
