import 'package:datingapp/widget/setting.dart';
import 'package:datingapp/widget/switch.dart';
import 'package:datingapp/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controller/auth_controller.dart';

class ProfileInfoScreen extends StatelessWidget {
  const ProfileInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (AuthController _) => Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 7.h,
                        backgroundColor: Color(0xff753748),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 6.h,
                          backgroundImage: AssetImage(
                            'assets/images/2.png',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text_widget("Jannet Doe", fontSize: 22.sp),
                        Container(
                          height: 5.h,
                          width: 35.w,
                          decoration: BoxDecoration(
                              color: Color(0xff753748),
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person_2_rounded,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              text_widget("Edit Profile",
                                  fontSize: 15.sp, color: Colors.white)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Container(
                    height: 70.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 20),
                      child: Column(
                        children: [
                          switchWidget(_.isUserAuthorized, "Get Notification",
                              Icons.notifications),
                          switchWidget(_.isUserAuthorized, "Location",
                              Icons.location_on_rounded),
                          settingWidget(
                            _.isUserAuthorized,
                            "Additional Settings",
                            Icons.settings,
                          ),
                          settingWidget(
                            _.isUserAuthorized,
                            "Linked Accounts",
                            Icons.link,
                          ),
                          settingWidget(
                            _.isUserAuthorized,
                            "Help Center",
                            Icons.help,
                          ),
                          settingWidget(
                            _.isUserAuthorized,
                            "About Us",
                            Icons.info,
                          ),
                          settingWidget(
                            _.isUserAuthorized,
                            "Log out",
                            Icons.logout,
                          ),
                        ],
                      ),
                    ))
              ],
            )));
  }
}
