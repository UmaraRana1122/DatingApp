import 'package:datingapp/widget/info_widget.dart';
import 'package:datingapp/widget/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 50.h,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            const Color(0xFF26CBE6),
            const Color(0xFF26CBC0),
          ], begin: Alignment.topCenter, end: Alignment.center)),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/sarah.png'),
                        radius: 7.h,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        'Sarah Ali',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: Container(
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.h, left: 4.w, right: 4.w),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black45,
                                blurRadius: 2.0,
                                offset: Offset(0.0, 2.0))
                          ]),
                      child: Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              headerChild('Photos', 114),
                              headerChild('Followers', 1205),
                              headerChild('Following', 360),
                            ]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Column(
                        children: [
                          infoChild(Icons.email, 'zulfiqar108@gmail.com'),
                          infoChild(Icons.call, '+12-1234567890'),
                          infoChild(Icons.group_add, 'Add to group'),
                          infoChild(Icons.chat_bubble, 'Show all comments'),
                          Padding(
                            padding: EdgeInsets.only(top: 5.h),
                            child: Container(
                              width: 30.w,
                              height: 5.h,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF26CBE6),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black87,
                                        blurRadius: 2.0,
                                        offset: Offset(0.0, 1.0))
                                  ]),
                              child: Center(
                                child: Text('FOLLOW ME',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
