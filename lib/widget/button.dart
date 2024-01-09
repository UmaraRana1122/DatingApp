import 'package:datingapp/Widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget button(BuildContext context, String text) {
  return Container(
    height: 7.h,
    width: 100.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(17),
      gradient: LinearGradient(
        colors: [
          Color(0xFFE84545),
          Theme.of(context).primaryColor,
        ],
      ),
    ),
    child: Align(
        child: text_widget(text,
            fontSize: 18.sp, fontWeight: FontWeight.w500, color: Colors.white)),
  );
}
