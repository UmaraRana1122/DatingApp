import 'package:datingapp/services/auth_services.dart';
import 'package:datingapp/services/fire_store_service.dart';
import 'package:datingapp/services/global.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class AuthController extends GetxController {
  int currentindex = 0;

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cPassword = TextEditingController();

  bool check = false;
  int currentIndex = 0;
  List txts = [
    "Male",
    "Femal",
    "Anyone",
  ];

  suggestName() async {
    if (currentUser.userName == "") {
      name.text =
          (currentUser.email.split('@')[0]).replaceAll(RegExp(r"\d"), "");
      bool check =
          await Get.find<FirestoreServices>().checkUserNameExit(name.text);

      if (check) {
        bool check =
            await Get.find<FirestoreServices>().checkUserNameExit(name.text);
        if (check) {
          suggestName();
        }
      }
      currentUser.userName = name.text;
    } else {
      name.text =
          (currentUser.email.split('@')[0]).replaceAll(RegExp(r"\d"), "");
      bool check =
          await Get.find<FirestoreServices>().checkUserNameExit(name.text);
      if (check) {
        suggestName();
      }
      currentUser.userName = name.text;
    }
    update();
  }

  updateUser() async {
    await Get.find<FirestoreServices>().updateUser(currentUser);
  }

  changeEmail() async {
    if (email.text.isEmpty) {
      EasyLoading.showInfo('Enter Email Address');
      return;
    }

    if (!email.text.isEmail) {
      EasyLoading.showInfo('Enter Valid Email');
      return;
    }

    String message = await Get.find<AuthServices>().changeEmail(email.text);
    if (message == "") {
      currentUser.email = email.text;
      await Get.find<FirestoreServices>().registerUser();

      Get.back();
    } else {
      EasyLoading.showInfo(message);
    }
  }

  loginUser() async {
    if (email.text.isEmpty) {
      EasyLoading.showInfo('Enter Email Address');
      return;
    }

    if (!email.text.isEmail) {
      EasyLoading.showInfo('Enter Valid Email');
      return;
    }
    if (password.text.isEmpty) {
      EasyLoading.showInfo('Enter Password');
      return;
    }

    EasyLoading.show();
    String str =
        await Get.find<AuthServices>().emailSignIn(email.text, password.text);
    if (str == "") {
      currentUser =
          await Get.put(FirestoreServices()).getUser(currentUser.id) ??
              UserModel();
      await Get.find<FirestoreServices>().updateUser(currentUser);
      EasyLoading.dismiss();
      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        print('login');
      } else {
        print('verify');
      }
    } else {
      EasyLoading.showError(str);
    }
  }

  forgetPassword() async {
    if (email.text.isEmpty) {
      EasyLoading.showInfo('Enter Email Address');
      return;
    }

    if (!email.text.isEmail) {
      EasyLoading.showInfo('Enter Valid Email');
      return;
    }

    EasyLoading.show();
    try {
      String str = await Get.find<AuthServices>().forgetPassword(email.text);
      if (str == "") {
        EasyLoading.dismiss();
        EasyLoading.showInfo('Check your email for reset password');
        Get.back();
      } else {
        print("Password reset error: $str");
        EasyLoading.showError(str);
      }
    } catch (error) {
      print("Exception during password reset: $error");
      EasyLoading.showError("An error occurred during password reset");
    }
  }

  registerUser() async {
    EasyLoading.show();

    if (name.text.isEmpty) {
      return;
    }

    if (email.text.isEmpty) {
      EasyLoading.showInfo('Enter Email Address');
      return;
    }

    if (!email.text.isEmail) {
      EasyLoading.showInfo('Enter Valid Email');
      return;
    }

    if (password.text.isEmpty) {
      EasyLoading.showInfo('Enter Password');
      return;
    }

    if (password.text.length < 6) {
      EasyLoading.showInfo('Your password is weak');
      return;
    }

    if (password.text != cPassword.text) {
      EasyLoading.showInfo('Password doesn\'t match');
      return;
    }

    try {
      if (currentUser.userType == 1) {
        name.text = name.text.replaceAll(' ', '');

        bool check = await Get.find<FirestoreServices>()
            .checkUserNameExit(name.text.toLowerCase());

        if (check) {
          EasyLoading.showInfo('Username is not available');
          return;
        }
        currentUser.userName = name.text;
      } else {
        currentUser.name = name.text;
      }

      currentUser.email = email.text;
      currentUser.initialPassword = password.text;
      currentUser.createDate = DateTime.now();

      String str = await Get.find<AuthServices>().emailSignUp();

      if (str == "") {
        await Get.find<FirestoreServices>().registerUser();

        EasyLoading.dismiss();

        await Get.find<AuthServices>().sendEmailVarification();
      } else {
        EasyLoading.showError(str);
      }
    } catch (_) {}

    EasyLoading.dismiss();
  }

  gmailLogin() async {
    EasyLoading.show();

    bool value = await Get.find<AuthServices>().googleLogin();

    if (value) {
      EasyLoading.dismiss();

      UserModel? user =
          await Get.find<FirestoreServices>().getUser(currentUser.id);

      if (user == null) {
        currentUser.userType = 0;

        await Get.find<FirestoreServices>().registerUser();
      } else {
        currentUser = user;

        await Get.find<FirestoreServices>().updateUser(currentUser);
      }
    } else {
      currentUser = UserModel();

      EasyLoading.showInfo('Error in Login');
    }
  }
}
