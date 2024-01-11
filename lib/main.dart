import 'package:datingapp/api/fire_store_api.dart';
import 'package:datingapp/models/user_model.dart';
import 'package:datingapp/screens/auth/login.dart';
import 'package:datingapp/screens/home_screens/home_screen.dart';
import 'package:datingapp/services/auth_services.dart';
import 'package:datingapp/services/fire_store_service.dart';
import 'package:datingapp/services/global.dart';
import 'package:datingapp/services/local_services.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await onInit();
  runApp(MyApp());
}

Future<void> onInit() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.cubeGrid;
  EasyLoading.instance.toastPosition = EasyLoadingToastPosition.top;
  EasyLoading.instance.dismissOnTap = false;
  EasyLoading.instance.displayDuration = const Duration(seconds: 3);
  Get.put(AuthServices());
  Get.put(FirestoreApi());
  Get.put(FirestoreServices());
  Get.put(LocalServices());
  allUsers = await getAllUsers();
  await Get.find<AuthServices>().checkUser();
  if (currentUser.id != '') {
    currentUser =
        (await Get.find<FirestoreServices>().getUser(currentUser.id)) ??
            UserModel();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
