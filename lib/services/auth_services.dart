import 'dart:convert';
import 'dart:math' as math;
import 'package:crypto/crypto.dart' as cry;
import 'package:datingapp/services/global.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<String> emailSignIn(String email, password) async {
    try {
      UserCredential fbUser = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (fbUser.user != null) {
        currentUser.id = fbUser.user?.uid ?? "";
        return "";
      }
      return "error";
    } on FirebaseAuthException catch (error) {
      FirebaseAuth.instance.signOut();
      return error.message ?? error.code;
    }
  }

  checkUser() async {
    try {
      currentUser.id = _auth.currentUser?.uid ?? "";
    } on FirebaseAuthException {
      currentUser.id = "";
    }
  }

  Future<String> emailSignUp() async {
    try {
      UserCredential fbUser = await _auth.createUserWithEmailAndPassword(
          email: currentUser.email, password: currentUser.initialPassword);
      if (fbUser.user != null) {
        currentUser.id = fbUser.user!.uid;
        return "";
      }
      return "error";
    } on FirebaseAuthException catch (error) {
      return error.code;
    }
  }

  Future<String> changeEmail(String newEmail) async {
    try {
      EasyLoading.show();
      await FirebaseAuth.instance.currentUser!.updateEmail(newEmail);
      await sendEmailVarification();
      EasyLoading.dismiss();
      return "";
    } on FirebaseAuthException catch (error) {
      print(error.message ?? error.code);
      return (error.message ?? error.code);
    }
  }

  Future<bool> checkEmailVarification() async {
    try {
      await FirebaseAuth.instance.currentUser!.reload();
      return FirebaseAuth.instance.currentUser!.emailVerified;
    } catch (e) {
      return false;
    }
  }

  Future<bool> sendEmailVarification() async {
    try {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      // FirebaseAuth.instance.currentUser!
      //     .updateEmail('anthonynealtodd@gmail.com');
      EasyLoading.showSuccess("Resent Email Send");
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String> forgetPassword(String mail) async {
    try {
      await _auth.sendPasswordResetEmail(email: mail);
      return "";
    } on FirebaseAuthException catch (error) {
      return error.message ?? error.code;
    }
  }

  Future<bool> googleLogin() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        User? user = (await _auth.signInWithCredential(authCredential)).user;
        if (user == null) {
          return false;
        } else {
          currentUser.name = googleSignInAccount.displayName ?? "";
          currentUser.email = googleSignInAccount.email;
          currentUser.loginType = "google";
          currentUser.profileImage = googleSignInAccount.photoUrl ?? "";
          currentUser.id = user.uid;
          return true;
        }
      }
    } catch (_) {}
    return false;
  }

  // Future<bool> appleLogin() async {
  //   try {
  //     final rawNonce = generateNonce();
  //     final nonce = sha256ofString(rawNonce);
  //     AuthorizationCredentialAppleID appleCredential =
  //         await SignInWithApple.getAppleIDCredential(
  //             scopes: [
  //           AppleIDAuthorizationScopes.email,
  //           AppleIDAuthorizationScopes.fullName
  //         ],
  //             nonce: nonce,
  //             webAuthenticationOptions: WebAuthenticationOptions(
  //                 clientId: 'com.youme.login',
  //                 redirectUri: Uri.parse(
  //                     'https://you-me-2baf6.firebaseapp.com/__/auth/handler')));

  //     OAuthCredential authCredential = OAuthProvider("apple.com").credential(
  //         idToken: appleCredential.identityToken, rawNonce: rawNonce);
  //     User? user =
  //         (await FirebaseAuth.instance.signInWithCredential(authCredential))
  //             .user;
  //     if (user == null) {
  //       return false;
  //     } else {
  //       // currentUser.userName =
  //       //     '${appleCredential.givenName} ${appleCredential.familyName}';
  //       currentUser.email = '${appleCredential.email}';
  //       currentUser.id = user.uid;
  //       currentUser.loginType = "apple";
  //       return true;
  //     }
  //   } catch (_) {}
  //   return false;
  // }

  // Future<void> logOut() async {
  //   currentUser.fcmId = "";
  //   await Get.find<FirestoreServices>().updateUser(currentUser);
  //   await _auth.signOut();
  //   await Get.find<NotificationServices>().unSubscribeToTopic('adminMessages');
  //   Get.find<NotificationServices>().deleteAllScheduledNotifications();
  //   currentUser = UserModel();
  //   try {
  //     await _googleSignIn.signOut();
  //   } catch (e) {
  //     log(e.toString());
  //   }
  //   try {
  //     await DefaultCacheManager().emptyCache();
  //   } catch (e) {
  //     log(e.toString());
  //   }
  //   try {
  //     await Get.find<LocalServices>().clear();
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = math.Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = cry.sha256.convert(bytes);
    return digest.toString();
  }
}
