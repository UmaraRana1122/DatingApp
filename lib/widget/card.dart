import 'package:datingapp/Widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget cardWidget(String text) {
  return Column(
    children: [
      Row(
        children: [
          text_widget(text,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white),
          SizedBox(
            width: 4.w,
          ),
          text_widget("29",
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white),
          Spacer(),
          Icon(
            Icons.info,
            size: 3.h,
            color: Colors.white,
          )
        ],
      ),
      Row(
        children: [
          Icon(
            Icons.school,
            size: 3.h,
            color: Colors.white,
          ),
          SizedBox(
            width: 2.w,
          ),
          text_widget("Swipe Right University",
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ],
      ),
      Row(
        children: [
          Icon(
            Icons.location_on,
            size: 3.h,
            color: Colors.white,
          ),
          SizedBox(
            width: 2.w,
          ),
          text_widget("3 miles away",
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ],
      ),
      SizedBox(
        height: 2.h,
      ),
    ],
  );
}
