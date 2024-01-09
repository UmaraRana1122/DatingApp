import 'package:datingapp/Widget/text_widget.dart';
import 'package:datingapp/screens/boarding_screens/boarding_screen.dart';
import 'package:datingapp/widget/button.dart';
import 'package:datingapp/widget/genericTextWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            text_widget("Forgot Password?"),
            text_widget("No worries,we'll send you reset instructions.",
                fontSize: 16.sp, fontWeight: FontWeight.w400),
            SizedBox(
              height: 2.h,
            ),
            TextField(
              // controller: _.email,
              enabled: true,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: .3.w, color: Colors.black54),
                    borderRadius: BorderRadius.circular(11.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black54,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  hintText: "Enter email"),
            ),
            SizedBox(
              height: 6.h,
            ),
            button(context, "Reset Password"),
            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back_outlined),
                SizedBox(
                  width: 3.w,
                ),
                text_widget("Back to Login", fontSize: 16.sp),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
