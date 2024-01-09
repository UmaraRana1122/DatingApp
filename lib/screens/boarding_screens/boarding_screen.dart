import 'package:datingapp/Widget/button.dart';
import 'package:datingapp/screens/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Widget/text_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
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
                  text_widget("Arrow", fontSize: 22.sp),
                ],
              ),
              Spacer(),
              SvgPicture.asset(
                'assets/logo/couple.svg',
                height: 20.h,
              ),
              SizedBox(
                height: 2.h,
              ),
              text_widget("Welcome to Arrow",
                  fontSize: 18.sp,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600),
              text_widget(
                  "Meet and enjoy yourselves with pleasure without continuing",
                  fontSize: 16.sp,
                  color: Colors.black54,
                  fontWeight: FontWeight.w400),
              Spacer(
                flex: 1,
              ),
              InkWell(
                  onTap: () {
                    Get.to(() => SignUpScreen());
                  },
                  child: button(context, "Start"))
            ],
          ),
        ),
      ),
    );
  }
}
