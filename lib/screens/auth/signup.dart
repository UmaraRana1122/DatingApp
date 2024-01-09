import 'package:datingapp/widget/button.dart';
import 'package:datingapp/widget/genericTextWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                  hintText: "Full Name"),
            ),
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
                  hintText: "Password"),
            ),
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
                  hintText: "Email"),
            ),
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
                  hintText: "Phone Number"),
            ),
            SizedBox(
              height: 6.h,
            ),
            button(context, "Sign Up"),
            SizedBox(
              height: 5.h,
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
