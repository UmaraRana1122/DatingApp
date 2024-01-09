import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget text_widget(String text,
    {fontSize, FontWeight? fontWeight, Color? color}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: GoogleFonts.inter(
        color: color ?? Colors.black,
        fontSize: fontSize ?? 20.sp,
        fontWeight: fontWeight ?? FontWeight.w700),
  );
}
