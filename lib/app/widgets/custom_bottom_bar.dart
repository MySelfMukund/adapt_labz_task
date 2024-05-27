import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:problem_statement/app/modules/home_navigation/controllers/home_navigation_controller.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({super.key, required this.navigationController, required this.selectedIndex});

  // Function(BottomBarEnum)? onChanged;
  int? selectedIndex;
  final HomeNavigationController navigationController;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: Icons.home,
      // activeIcon: ImageConstant.imgNavDashboard,
      title: "Home",
      type: BottomBarEnum.Dashboard,
    ),
    BottomMenuModel(
      icon: Icons.photo_album_outlined,
      // activeIcon: ImageConstant.imgNavCaseActive,
      title: "My Albums",
      type: BottomBarEnum.Case,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.w),
        ),
      ),
      child: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          elevation: 0,
          currentIndex: widget.navigationController.currentTabIndex,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(bottomMenuList[index].icon),
                  Padding(
                    padding: EdgeInsets.only(top: 1.h),
                    child: Text(
                      bottomMenuList[index].title!,
                    ),
                  ),
                ],
              ),
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    bottomMenuList[index].icon,
                    color: Colors.red,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 1.h),
                    child: Text(
                      bottomMenuList[index].title!,
                    ),
                  ),
                ],
              ),
              label: '',
            );
          }),
          onTap: (index) {
            widget.navigationController.onTabChange(index);
            widget.selectedIndex = index;
            // widget.onChanged?.call(bottomMenuList[index].type);
            // setState(() {});
          },
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Dashboard,
  Case,
  Favorite,
  FollowUp,
  Profile,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    // required this.activeIcon,
    this.title,
    required this.type,
  });

  IconData icon;

  // String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
