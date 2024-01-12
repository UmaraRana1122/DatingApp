import 'package:datingapp/controller/auth_controller.dart';
import 'package:datingapp/widget/button.dart';
import 'package:datingapp/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (AuthController _) => Scaffold(
              body: SafeArea(
                  child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.arrow_back_outlined),
                    SizedBox(
                      height: 2.h,
                    ),
                    text_widget("My Profile Details"),
                    SizedBox(
                      height: 2.h,
                    ),
                    text_widget("My email address",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                    TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    text_widget("My full name",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                    TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    text_widget("My birthday",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                    TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    text_widget("I am a ",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            _.currentindex = 0;
                            _.update();
                          },
                          child: Container(
                              height: 5.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                color: _.currentindex == 0
                                    ? Colors.grey
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: text_widget(
                                        "Female",
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 1.h,
                                      backgroundColor: _.currentindex == 0
                                          ? Colors.red
                                          : Colors.transparent,
                                    )
                                  ],
                                ),
                              )),
                        ),
                        SizedBox(
                          width: 3.5.w,
                        ),
                        InkWell(
                          onTap: () {
                            _.currentindex = 1;
                            _.update();
                          },
                          child: Container(
                              height: 5.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                color: _.currentindex == 1
                                    ? Colors.grey
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: text_widget(
                                        "Male",
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    CircleAvatar(
                                      radius: 1.h,
                                      backgroundColor: _.currentindex == 1
                                          ? Colors.red
                                          : Colors.transparent,
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    text_widget("My city",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                    TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                      ),
                    ),
                    Spacer(),
                    button(context, "Confirm")
                  ],
                ),
              )),
            ));
  }
}
