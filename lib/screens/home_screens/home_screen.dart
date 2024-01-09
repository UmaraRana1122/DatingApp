import 'package:datingapp/screens/home_screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;

  List text = ["Janet Doe", "Jane Doe", "Janny Doe"];
  final List pics = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
  ];

  @override
  void initState() {
    for (int i = 0; i < text.length; i++) {
      _swipeItems.add(SwipeItem(
        content: [
          Container(
              alignment: Alignment.center,
              child: Image.asset(
                pics[i],
                height: 70.h, 
              )),
        ],
        likeAction: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Liked ${text[i]}"),
            duration: Duration(milliseconds: 500),
          ));
        },
        nopeAction: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Nope ${text[i]}"),
            duration: Duration(milliseconds: 500),
          ));
        },
        superlikeAction: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Superliked ${text[i]}"),
            duration: Duration(milliseconds: 500),
          ));
        },
        onSlideUpdate: (SlideRegion? region) async {
          print("Region $region");
        },
      ));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/icons/4.png",
                    height: 4.h,
                  ),
                  Image.asset(
                    "assets/icons/5.png",
                    height: 4.h,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => ChatScreen());
                    },
                    child: Image.asset(
                      "assets/icons/6.png",
                      height: 4.h,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Stack(
                children: [
                  SizedBox(
                    height: 80.h,
                    child: SwipeCards(
                      matchEngine: _matchEngine!,
                      itemBuilder: (BuildContext context, int index) {
                        return _swipeItems[index].content[0];
                      },
                      onStackFinished: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Profiles Finished"),
                          duration: Duration(milliseconds: 500),
                        ));
                      },
                      itemChanged: (SwipeItem item, int index) {
                        print(
                            "item: ${_swipeItems[index].content[0]}, index: $index");
                      },
                      leftSwipeAllowed: true,
                      rightSwipeAllowed: true,
                      upSwipeAllowed: true,
                      fillSpace: true,
                      likeTag: Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                        ),
                        child: Text('Like'),
                      ),
                      nopeTag: Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                        ),
                        child: Text('Nope'),
                      ),
                      superLikeTag: Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange),
                        ),
                        child: Text('Super Like'),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _matchEngine!.currentItem?.nope();
                          },
                          child: Text("Nope"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _matchEngine!.currentItem?.superLike();
                          },
                          child: Text("Superlike"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _matchEngine!.currentItem?.like();
                          },
                          child: Text("Like"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
