import 'dart:io';

import 'package:datingapp/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          bottom: false,
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
                  text_widget("Profile info", color: Colors.white),
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
              text_widget("Add Photos", color: Colors.white),
              SizedBox(
                height: 2.h,
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      5,
                      (index) => Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Container(
                            height: 15.h,
                            width: 35.w,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: InkWell(
                              onTap: () {
                                pickImage();
                              },
                              child: Icon(
                                Icons.add,
                                size: 5.h,
                              ),
                            )),
                      ),
                    ),
                  )),
              image != null ? Image.file(image!) : Text("No image selected"),
              Stack(
                children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 100.w,
                        height: 42.h,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFE84545),
                              Color(0xff753748),
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(23.0),
                          child: SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  text_widget("Information",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)
                                ]),
                          ),
                        ),
                      ))
                ],
              )
            ],
          ),
        ));
  }
}
