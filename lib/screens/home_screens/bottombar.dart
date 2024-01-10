import 'package:datingapp/screens/home_screens/chat_screen.dart';
import 'package:datingapp/screens/home_screens/home_screen.dart';
import 'package:datingapp/screens/home_screens/interest.dart';
import 'package:datingapp/screens/home_screens/profile_info.dart';
import 'package:datingapp/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavigation extends StatefulWidget {
  static const title = 'salomon_bottom_bar';

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavController>(
        init: NavController(),
        builder: (NavController con) => Scaffold(
              extendBody: true,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.miniCenterDocked,
              floatingActionButton: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(17),
                  child: SalomonBottomBar(
                    backgroundColor: Color(0xffFFFFFF),
                    selectedColorOpacity: 1,
                    currentIndex: con.currentIndex,
                    onTap: (i) => setState(() => con.currentIndex = i),
                    items: [
                      SalomonBottomBarItem(
                        icon: Image.asset(
                          "assets/icons/home.png",
                          height: 2.2.h,
                          color: Colors.black,
                        ),
                        title: text_widget("Home".tr,
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                        selectedColor: Color(0xff753748),
                      ),
                      SalomonBottomBarItem(
                        icon: con.currentIndex == 1
                            ? Icon(
                                Icons.favorite,
                                color: Colors.black,
                              )
                            : Icon(
                                Icons.favorite,
                                color: Colors.black,
                              ),
                        title: text_widget("Favourite".tr,
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                        selectedColor: Color(0xff753748),
                      ),
                      SalomonBottomBarItem(
                        icon: Image.asset(
                          "assets/icons/mess.png",
                          color: Colors.black,
                          height: 2.9.h,
                        ),
                        title: text_widget("Chat".tr,
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                        selectedColor: Color(0xff753748),
                      ),
                      SalomonBottomBarItem(
                        icon: Icon(
                          Icons.person,
                          color: Colors.black,
                          size: 3.h,
                        ),
                        title: text_widget("Profile".tr,
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                        selectedColor: Color(0xff753748),
                      ),
                    ],
                  ),
                ),
              ),
              resizeToAvoidBottomInset: false,
              body: PageStorage(
                  bucket: bucket,
                  child: Stack(children: [
                    con.currentIndex == 0
                        ? HomeScreen()
                        : con.currentIndex == 1
                            ? InterestScreen()
                            : con.currentIndex == 2
                                ? ChatScreen()
                                : con.currentIndex == 3
                                    ? ProfileInfoScreen()
                                    : Container(),
                  ])),
            ));
  }
}

class NavController extends GetxController {
  int currentTab = 0;
  int currentIndex = 0;
}
