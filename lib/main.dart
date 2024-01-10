import 'package:datingapp/screens/home_screens/bottombar.dart';
import 'package:datingapp/screens/home_screens/profile_info.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> main() async {
  // await onInit();
  runApp(const MyApp());
}

// Future<void> onInit() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//   EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.cubeGrid;
//   EasyLoading.instance.toastPosition = EasyLoadingToastPosition.top;
//   EasyLoading.instance.dismissOnTap = false;
//   EasyLoading.instance.displayDuration = const Duration(seconds: 3);
//   Get.put(AuthServices());
//   Get.put(FirestoreApi());
//   Get.put(FirestoreServices());
//   Get.put(LocalServices());
//   await Get.find<AuthServices>().checkUser();
//   if (currentUser.id != '') {
//     currentUser =
//         (await Get.find<FirestoreServices>().getUser(currentUser.id)) ??
//             UserModel();
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: BottomNavigation(
              // verificationId: '',
              ),
          // builder: EasyLoading.init(),
        );
      },
    );
  }
}
