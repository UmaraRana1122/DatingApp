import 'package:datingapp/Widget/button.dart';
import 'package:datingapp/screens/auth/Gender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Widget/genericTextWidget.dart';

class OnboardingVerificationScreen extends StatelessWidget {
  const OnboardingVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Text(
                "Did You Get the \nVerification Code?",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: Colors.black54),
              ),
              SizedBox(
                height: 3.h,
              ),
              TextField(
                enabled: true,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(11),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: .3.w, color: Colors.black54),
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black54,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    hintText: "Enter Your Code Here"),
              ),
              Spacer(),
              InkWell(
                  onTap: () {
                    Get.to(() => GenderScreen());
                  },
                  child: button(context, "Next Step"))
            ],
          ),
        ),
      ),
    );
  }
}
