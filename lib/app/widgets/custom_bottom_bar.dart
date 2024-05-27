import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:problem_statement/app/modules/home_navigation/controllers/home_navigation_controller.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar(
      {required this.navigationController, required this.selectedIndex});

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
                  IconButton(
                    icon: bottomMenuList[index].icon,
                    height: bottomMenuList[index].title == 'Follow Up' ||
                            bottomMenuList[index].title == 'Case'
                        ? 50.adaptSize
                        : 24.adaptSize,
                    width: bottomMenuList[index].title == 'Follow Up' ||
                            bottomMenuList[index].title == 'Case'
                        ? 60.adaptSize
                        : 24.adaptSize,
                    // color: appTheme.gray400,
                  ),
                  bottomMenuList[index].title == 'Follow Up' ||
                          bottomMenuList[index].title == 'Case'
                      ? SizedBox()
                      : Padding(
                          padding: EdgeInsets.only(top: 1.h),
                          child: Text(
                            bottomMenuList[index].title ?? "",
                            style: theme.textTheme.bodySmall!.copyWith(
                              color: appTheme.gray400,
                            ),
                          ),
                        ),
                ],
              ),
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // height: 26.h,
                    width: bottomMenuList[index].title == 'Follow Up' ||
                            bottomMenuList[index].title == 'Case'
                        ? 50.w
                        : 25.w,
                    child:
                        // Stack(
                        //   alignment: Alignment.topRight,
                        //   children: [
                        //   InkWell(
                        // child:
                        CustomImageView(
                      imagePath: bottomMenuList[index].activeIcon,
                      height: bottomMenuList[index].title == 'Follow Up' ||
                              bottomMenuList[index].title == 'Case'
                          ? 50.adaptSize
                          : 24.adaptSize,
                      width: bottomMenuList[index].title == 'Follow Up' ||
                              bottomMenuList[index].title == 'Case'
                          ? 60.adaptSize
                          : 24.adaptSize,
                      color: appTheme.blueA20001,
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(
                        top: 2.h,
                        right: 1.w,
                      ),
                    ),
                    //   onTap: () {},
                    //   splashColor: Colors.black,
                    // ),
                    // bottomMenuList[index].title == 'Follow Up' ||
                    //         bottomMenuList[index].title == 'Case'
                    //     ? SizedBox()
                    //     : Align(
                    //         alignment: Alignment.topRight,
                    //         child: Container(
                    //           width: 12.adaptSize,
                    //           margin: EdgeInsets.only(
                    //             left: 13.w,
                    //             bottom: 14.h,
                    //           ),
                    //           decoration: AppDecoration.fillOrange.copyWith(
                    //             borderRadius:
                    //                 BorderRadiusStyle.circleBorder6,
                    //           ),
                    //           child: Text(
                    //             "1".toUpperCase(),
                    //             style: theme.textTheme.labelSmall,
                    //           ),
                    //         ),
                    //       ),
                    //   ],
                    // ),
                  ),
                  bottomMenuList[index].title == 'Follow Up' ||
                          bottomMenuList[index].title == 'Case'
                      ? SizedBox()
                      : Text(
                          bottomMenuList[index].title ?? "",
                          style:
                              CustomTextStyles.labelMediumBlueA20001.copyWith(
                            color: appTheme.blueA20001,
                          ),
                        ),
                ],
              ),
              label: '',
            );
          }),
          onTap: (index) {
            widget.navigationController.changeTabIndex(index);
            // widget.selectedIndex = index;
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
