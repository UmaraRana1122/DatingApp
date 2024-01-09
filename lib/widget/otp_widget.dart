import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget textFieldOTP(context, TextEditingController otpControllers,
    {bool first = false, bool last = false}) {
  return SizedBox(
    height: 85,
    width: 10.w,
    child: AspectRatio(
      aspectRatio: 1.0,
      child: TextField(
        controller: otpControllers,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counter: Offstage(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.black12),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Color(0xff000000)),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    ),
  );
}
