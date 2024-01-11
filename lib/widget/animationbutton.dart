import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// the card for us.
Widget animationButton(
  final VoidCallback onPressed,
) {
  return InkWell(
    onTap: () {
      onPressed;
    },
    child: Material(
      borderRadius: BorderRadius.circular(20),
      elevation: 2,
      child: CircleAvatar(
        radius: 3.h,
        backgroundColor: Colors.white,
        child: Icon(
          Icons.restart_alt_outlined,
          color: Colors.amber,
          size: 3.5.h,
        ),
      ),
    ),
  );
}
