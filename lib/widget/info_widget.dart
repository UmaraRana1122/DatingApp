import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
 Widget infoChild( IconData icon, data) =>  Padding(
        padding:  EdgeInsets.only(bottom: 8.0),
        child:  InkWell(
          child:  Row(
            children: [
               SizedBox(
                width: 5.w,
              ),
               Icon(
                icon,
                color: const Color(0xFF26CBE6),
                size: 36.0,
              ),
               SizedBox(
                width: 2.w,
              ),
               Text(data)
            ],
          ),
          onTap: () {
            print('Info Object selected');
          },
        ),
      );
