import 'package:datingapp/Widget/chat_widget.dart';
import 'package:datingapp/Widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back)),
                    SizedBox(
                      width: 7.w,
                    ),
                    Image.asset(
                      "assets/images/sarah.png",
                      height: 6.h,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text_widget("Janne Doe",
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600),
                        SizedBox(
                          height: .2.h,
                        ),
                        text_widget("Online",
                            color: Color(0xff797C7B),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                chatWidget("Hello! John Abraham"),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/sarah.png",
                      height: 5.h,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text_widget("Janne", fontSize: 17.sp),
                        SizedBox(
                          height: .7.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: 6.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                  color: Color(0xffde9eb0),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(17),
                                    bottomLeft: Radius.circular(17),
                                    bottomRight: Radius.circular(17),
                                  )),
                              child: Align(
                                child: text_widget(
                                    "Hello ! Nazrul How are you?",
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: .7.h,
                            ),
                            Text(
                              "9:25 AM",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      color: Color(0xff797C7B),
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                chatWidget("You did your job well!"),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/sarah.png",
                      height: 5.h,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text_widget("Janne", fontSize: 17.sp),
                        SizedBox(
                          height: .7.h,
                        ),
                        Container(
                          height: 6.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                              color: Color(0xffde9eb0),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(17),
                                bottomLeft: Radius.circular(17),
                                bottomRight: Radius.circular(17),
                              )),
                          child: Align(
                            child: text_widget("Have a great working week!!",
                                color: Colors.black,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          height: .7.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: 6.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                  color: Color(0xffde9eb0),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(17),
                                    bottomLeft: Radius.circular(17),
                                    bottomRight: Radius.circular(17),
                                  )),
                              child: Align(
                                child: text_widget("Hope you like it",
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: .7.h,
                            ),
                            Text(
                              "9:25 AM",
                              style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      color: Color(0xff797C7B),
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                chatWidget("You did your job well!!"),
                Spacer(
                  flex: 1,
                ),
                Divider(),
                SizedBox(
                  height: 1.5.h,
                ),
                TextField(
                  cursorColor: Color(0xff4B5768),
                  // controller: _.email1,
                  // onSubmitted: ((value) {
                  //   _.email1.text = value;
                  // }),
                  style: TextStyle(color: Color(0xffdcdcdd)),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffF7F8F9),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 17.0, horizontal: 18),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffE8ECF4),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffE8ECF4),
                            width: .3.w,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      hintText: 'Write your message',
                      hintStyle: GoogleFonts.lora(
                          textStyle: TextStyle(
                              color: Color(0xff797C7B),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500)),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/icons/send.png",
                          height: .4.h,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
