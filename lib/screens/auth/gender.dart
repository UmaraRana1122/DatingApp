import 'package:datingapp/Widget/button.dart';
import 'package:datingapp/Widget/genericTextWidget.dart';
import 'package:datingapp/Widget/text_widget.dart';
import 'package:datingapp/screens/home_screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String option = 'amazon';
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: true,
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
                "What's Your Gender?",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: Colors.black54),
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  Radio(
                    activeColor: Colors.black,
                    value: '0',
                    groupValue: '$index',
                    onChanged: (value) {
                      setState(() {
                        option = value.toString();
                        index = 0;
                      });
                    },
                  ),
                  text_widget("Male",
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp,
                      color: Colors.black54),
                ],
              ),
              Row(
                children: [
                  Radio(
                    activeColor: Colors.black,
                    value: '1',
                    groupValue: '$index',
                    onChanged: (value) {
                      setState(() {
                        option = value.toString();
                        index = 1;
                      });
                    },
                  ),
                  text_widget("Female",
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp,
                      color: Colors.black54),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                "What's Your Age?",
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
                    hintText: "Enter your age"),
              ),
              Spacer(),
              InkWell(
                  key: Key('ff'),
                  onTap: () {
                    Get.to(() => HomeScreen());
                  },
                  child: button(context, "Next Step")),
            ],
          ),
        ),
      ),
    );
  }
}
