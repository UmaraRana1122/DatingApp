import 'package:datingapp/widget/profile.dart';
import 'package:datingapp/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Color(0xff753748),
                    ),
                    text_widget("Profile info", color: Colors.black),
                    CircleAvatar(
                        backgroundColor: Color(0xff753748),
                        child: Icon(
                          Icons.done,
                          color: Colors.white,
                        )),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 8.h,
                    backgroundImage: AssetImage(
                      'assets/images/2.png',
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        radius: 2.7.h,
                        backgroundColor: Color(0xff753748),
                        child: CircleAvatar(
                            radius: 2.1.h,
                            backgroundColor: Color(0xffD9D9D9),
                            child: Icon(Icons.edit)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                profileContainer(
                  "Name",
                ),
                Divider(),
                profileContainer(
                  "Email",
                ),
                Divider(),
                profileContainer(
                  "Phone",
                ),
                Divider(),
                profileContainer(
                  "Gender",
                ),
                Divider(),
                profileContainer(
                  "Date of Birth",
                ),
                Divider(),
              ],
            ),
          ),
        ));
  }
}
