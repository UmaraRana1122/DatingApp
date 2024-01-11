import 'dart:developer';

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datingapp/models/user_model.dart';
import 'package:datingapp/screens/home_screens/chat_screen.dart';
import 'package:datingapp/widget/animationbutton.dart';
import 'package:datingapp/widget/swipeleft.dart';
import 'package:datingapp/widget/swiperight.dart';
import 'package:datingapp/widget/unswipeButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AppinioSwiperController controller = AppinioSwiperController();
  List cards = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
  ];

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((_) {
      _shakeCard();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/icons/4.png",
                      height: 3.5.h,
                    ),
                    Image.asset(
                      "assets/icons/5.png",
                      height: 3.5.h,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => ChatScreen());
                      },
                      child: Image.asset(
                        "assets/icons/6.png",
                        height: 3.5.h,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 70.h,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                      top: 50,
                      bottom: 40,
                    ),
                    child: AppinioSwiper(
                      invertAngleOnBottomDrag: true,
                      backgroundCardCount: 3,
                      swipeOptions: const SwipeOptions.all(),
                      controller: controller,
                      onCardPositionChanged: (
                        SwiperPosition position,
                      ) {},
                      onSwipeEnd: (previousIndex, targetIndex, activity) {
                        _swipeEnd(previousIndex, targetIndex, activity);
                      },
                      onEnd: () {
                        _onEnd();
                      },
                      cardCount: cards.length,
                      cardBuilder: (BuildContext context, int index) {
                        return myItem(cards[index], 'Card $index');
                      },
                    ),
                  ),
                ),
                IconTheme.merge(
                  data: const IconThemeData(size: 40),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        animationButton(_shakeCard),
                        const SizedBox(
                          width: 20,
                        ),
                        swipeLeftButton(controller),
                        const SizedBox(
                          width: 20,
                        ),
                        swipRightButton(controller),
                        const SizedBox(
                          width: 20,
                        ),
                        unswipeButton(controller),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _swipeEnd(int previousIndex, int targetIndex, SwiperActivity activity) {
    switch (activity) {
      case Swipe():
        log('The card was swiped to the : ${activity.direction}');
        log('previous index: $previousIndex, target index: $targetIndex');
        break;
      case Unswipe():
        log('A ${activity.direction.name} swipe was undone.');
        log('previous index: $previousIndex, target index: $targetIndex');
        break;
      case CancelSwipe():
        log('A swipe was cancelled');
        break;
      case DrivenActivity():
        log('Driven Activity');
        break;
    }
  }

  void _onEnd() {
    log('end reached!');
  }

  Future<void> _shakeCard() async {
    const double distance = 30;
    await controller.animateTo(
      const Offset(-distance, 0),
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
    await controller.animateTo(
      const Offset(distance, 0),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    await controller.animateTo(
      const Offset(0, 0),
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }
}

Widget myItem(String image, String name) => Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: [
        Card(
            elevation: 20,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(image)),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            name,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    );

Future<List<UserModel>> getAllUsers() async {
  try {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('userProfile').get();

    List<UserModel> users = [];

    querySnapshot.docs.forEach((doc) {
      // Assuming UserModel is your data model class
      UserModel user = UserModel.toModel(doc.data() as Map<String, dynamic>);
      users.add(user);
    });
    print(users.length);
    return users;
  } catch (e) {
    print('Error getting users: $e');
    return [];
  }
}
