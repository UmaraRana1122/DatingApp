import 'package:datingapp/Widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget chatWidget(String text) {
  return Column(
    children: [
      Align(
        alignment: Alignment.bottomRight,
        child: Container(
          height: 6.h,
          width: 42.w,
          decoration: BoxDecoration(
              color: Color(0xffF94F69),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(17),
                  bottomLeft: Radius.circular(17),
                  bottomRight: Radius.circular(17))),
          child: Align(
            child: text_widget(text,
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
      SizedBox(
        height: .6.h,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Spacer(),
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
      )
    ],
  );
}
