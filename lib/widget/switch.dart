import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget switchWidget(bool isUserAuthorized, String text, IconData icon) {
  return StatefulBuilder(
    builder: (BuildContext context, setState) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              color: Color(0xffae7383),
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
            FlutterSwitch(
              height: 29,
              width: 58.0,
              toggleSize: 35.0,
              value: isUserAuthorized,
              borderRadius: 20.0,
              padding: 2,
              activeToggleColor: Colors.transparent,
              inactiveToggleColor: Colors.transparent,
              activeSwitchBorder: Border.all(
                color: Colors.transparent,
                width: 0.0,
              ),
              inactiveSwitchBorder: Border.all(
                color: Colors.white,
                width: 1.0,
              ),
              activeColor: Color(0xffae7383),
              inactiveColor: Colors.grey,
              activeIcon: CircleAvatar(
                backgroundColor: Colors.white,
              ),
              inactiveIcon: CircleAvatar(
                backgroundColor: Colors.white,
              ),
              onToggle: (val) {
                setState(() {
                  isUserAuthorized = val;
                });
              },
            )
          ],
        ),
      );
    },
  );
}
