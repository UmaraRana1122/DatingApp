import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget settingWidget(
  bool isUserAuthorized,
  String text,
  IconData icon,
) {
  return StatefulBuilder(
    builder: (BuildContext context, setState) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: Color(0xff753748),
              size: 4.h,
            ),
            SizedBox(
              width: 3.w,
            ),
            Text(text,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: Colors.black)),
            Spacer(),
            Icon(
              Icons.keyboard_arrow_right_rounded,
              color: Colors.white,
              size: 4.h,
            )
          ],
        ),
      );
    },
  );
}
