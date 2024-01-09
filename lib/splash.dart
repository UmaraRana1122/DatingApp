import 'package:datingapp/Widget/text_widget.dart';
import 'package:datingapp/screens/boarding_screens/boarding_screen.dart';
import 'package:datingapp/widget/genericTextWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OnboardingScreen()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Center(
            child: SvgPicture.asset(
              'assets/logo/log.svg',
            ),
          ),
          genericTextwidget("Arrow", fontSize: 30.sp),
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 3.h,
                    backgroundColor: Color(0xff753748),
                    child: Image.asset(
                      "assets/icons/sign.png",
                      height: 3.h,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  text_widget("Sign up", fontSize: 16.sp)
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 3.h,
                    backgroundColor: Color(0xff753748),
                    child: Image.asset(
                      "assets/icons/login.png",
                      height: 3.h,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  text_widget("Login", fontSize: 16.sp)
                ],
              ),
            ],
          ),
          Spacer(
            flex: 1,
          )
        ],
      ),
    );
  }
}
