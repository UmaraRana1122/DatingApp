import 'package:datingapp/Widget/text_widget.dart';
import 'package:datingapp/controller/auth_controller.dart';
import 'package:datingapp/screens/auth/signup.dart';
import 'package:datingapp/widget/button.dart';
import 'package:datingapp/widget/genericTextWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (AuthController _) => Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Spacer(),
                    Center(
                      child: SvgPicture.asset(
                        'assets/logo/log.svg',
                      ),
                    ),
                    genericTextwidget("Arrow", fontSize: 30.sp),
                    SizedBox(
                      height: 5.h,
                    ),
                    TextField(
                      controller: _.email,
                      enabled: true,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: .3.w, color: Colors.black54),
                            borderRadius: BorderRadius.circular(11.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black54,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(11))),
                          hintText: "Email"),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextField(
                      controller: _.password,
                      enabled: true,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: .3.w, color: Colors.black54),
                            borderRadius: BorderRadius.circular(11.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black54,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(11))),
                          hintText: "Password"),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    InkWell(
                        onTap: () {
                          _.gmailLogin();
                        },
                        child: button(context, "Login")),
                    SizedBox(
                      height: 1.h,
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child:
                            text_widget("Forgot Password?", fontSize: 16.sp)),
                    SizedBox(
                      height: 6.h,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => SignUpScreen());
                      },
                      child: Container(
                        height: 7.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          border:
                              Border.all(color: Colors.black87, width: .6.w),
                        ),
                        child: Align(
                            child: text_widget("Sign up",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.black)),
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    )
                  ],
                ),
              ),
            ));
  }
}
