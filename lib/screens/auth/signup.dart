import 'package:datingapp/controller/auth_controller.dart';
import 'package:datingapp/widget/button.dart';
import 'package:datingapp/widget/genericTextWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (AuthController _) => Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SafeArea(
                  child: Column(
                    children: [
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
                        controller: _.name,
                        enabled: true,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: .3.w, color: Colors.black54),
                              borderRadius: BorderRadius.circular(11.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black54,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(11))),
                            hintText: "Full Name"),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextField(
                        controller: _.email,
                        enabled: true,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: .3.w, color: Colors.black54),
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
                              borderSide: BorderSide(
                                  width: .3.w, color: Colors.black54),
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
                        height: 2.h,
                      ),
                      TextField(
                        controller: _.cPassword,
                        enabled: true,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: .3.w, color: Colors.black54),
                              borderRadius: BorderRadius.circular(11.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black54,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(11))),
                            hintText: "Confirm Password"),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      InkWell(
                          onTap: () {
                            _.registerUser();
                          },
                          child: button(context, "Register User")),
                    ],
                  ),
                ),
              ),
            ));
  }
}
