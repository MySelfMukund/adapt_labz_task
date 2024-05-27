import 'package:get/get.dart';
import 'package:problem_statement/app/routes/app_pages.dart';

class HomeNavigationController extends GetxController {
  final RxInt _currentTabIndex = 0.obs;
  int get currentTabIndex => _currentTabIndex.value;
  set currentTabIndex(int val) => _currentTabIndex.value = val;

  void onTabChange(int index) {
    currentTabIndex = index;
    switch (index) {
      case 0:
        Get.toNamed(Routes.HOME);
        break;
      case 1:
        Get.toNamed(Routes.MY_ALBUM);
        break;
      case 2:
        Get.toNamed(Routes.MY_POSTS);
    }
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/browse')
      return GetPageRoute(
        settings: settings,
        page: () => BrowsePage(),
        binding: BrowseBinding(),
      );

    if (settings.name == '/history')
      return GetPageRoute(
        settings: settings,
        page: () => HistoryPage(),
        binding: HistoryBinding(),
      );

    if (settings.name == '/settings')
      return GetPageRoute(
        settings: settings,
        page: () => SettingsPage(),
        binding: SettingsBinding(),
      );

    return null;
  }
}

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
