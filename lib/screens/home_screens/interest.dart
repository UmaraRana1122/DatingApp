import 'package:datingapp/Widget/button.dart';
import 'package:datingapp/screens/home_screens/home_screen.dart';
import 'package:datingapp/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Widget/genericTextWidget.dart';
import '../../controller/auth_controller.dart';

class InterestScreen extends StatelessWidget {
  const InterestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (AuthController _) => Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/logo/log.svg',
                            height: 5.h,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          genericTextwidget("Arrow", fontSize: 22.sp),
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Center(
                        child: Text(
                          "Who are you \nInterested In?",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20.sp,
                              color: Colors.black54),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      ...List.generate(_.txts.length, (index) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            _.currentIndex = index;
                            _.update();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                              height: 8.h,
                              width: 90.h,
                              decoration: BoxDecoration(
                                  color: _.currentIndex == index
                                      ? Color(0xff753748)
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: _.currentIndex == index
                                          ? Color(0xff3E9892)
                                          : Colors.transparent,
                                      width: .3.w)),
                              child: Align(
                                child: text_widget(_.txts[index],
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        );
                      }),
                      Spacer(),
                      InkWell(
                          onTap: () {
                            Get.to(() => HomeScreen());
                          },
                          child: button(context, "Next Step")),
                      Spacer(
                        flex: 1,
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
