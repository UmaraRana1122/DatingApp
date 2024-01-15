import 'package:flutter/material.dart';

Widget headerChild(String header, int value) =>  Expanded(
        child:  Column(
      children: <Widget>[
         Text(header),
         SizedBox(
          height: 8.0,
        ),
         Text(
          '$value',
          style:  TextStyle(
              fontSize: 14.0,
              color: const Color(0xFF26CBE6),
              fontWeight: FontWeight.bold),
        )
      ],
    ));
