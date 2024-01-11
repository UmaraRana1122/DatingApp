import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget swipRightButton(
  AppinioSwiperController controller,
) {
  return InkWell(
    onTap: () {
      controller.swipeLeft();
    },
    child: Material(
      borderRadius: BorderRadius.circular(20),
      elevation: 2,
      child: CircleAvatar(
        radius: 3.h,
        backgroundColor: Colors.white,
        child: Icon(
          Icons.favorite,
          color: Colors.green,
          size: 3.5.h,
        ),
      ),
    ),
  );
}
