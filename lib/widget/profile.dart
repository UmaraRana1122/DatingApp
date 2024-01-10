import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget profileContainer(
  String text,
) {
  return Container(
    margin: const EdgeInsets.only(left: 19.0, right: 19.0),
    height: 7.h,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(text,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
                color: Colors.grey)),
        Expanded(
          child: TextField(
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 19.sp,
                color: Colors.black),
            decoration: InputDecoration(
                hintText: "Edit",
                border: InputBorder.none,
                hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500)),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    ),
  );
}
