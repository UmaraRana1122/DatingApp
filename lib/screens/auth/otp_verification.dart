import 'package:datingapp/screens/auth/signup.dart';
import 'package:datingapp/widget/button.dart';
import 'package:datingapp/widget/genericTextWidget.dart';
import 'package:datingapp/widget/otp_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../widget/text_widget.dart';

// ignore: must_be_immutable
class OTPScreen extends StatefulWidget {
  String verificationId;

  OTPScreen({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  List<TextEditingController> otpController =
      List.generate(6, (_) => TextEditingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
              text_widget("Forgot Password?"),
              text_widget("No worries,we'll send you reset instructions.",
                  fontSize: 16.sp, fontWeight: FontWeight.w400),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                          6,
                          (index) =>
                              textFieldOTP(context, otpController[index])),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Center(
                      child: InkWell(
                          onTap: () async {
                            try {
                              String enteredOTP = otpController
                                  .map((controller) => controller.text)
                                  .join();

                              PhoneAuthCredential credential =
                                  PhoneAuthProvider.credential(
                                verificationId: widget.verificationId,
                                smsCode: enteredOTP,
                              );

                              await FirebaseAuth.instance
                                  .signInWithCredential(credential)
                                  .then((value) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpScreen(),
                                  ),
                                );
                              });
                            } catch (ex) {
                              print(ex.toString());
                            }
                          },
                          child: button(context, "Verify")),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                "Didn't you receive any code?",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Resend New Code",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
