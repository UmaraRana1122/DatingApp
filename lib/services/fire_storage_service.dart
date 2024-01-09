import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class FireStorageServices {
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> uploadPic(String folder, File image) async {
    String link = "";
    try {
      if (image.path == "") return link;
      // print("Image Size before Image cruncher in bytes: ");
      // print(await image.length());
      final dir = await path_provider.getTemporaryDirectory();
      final targetPath = '${dir.absolute.path}/temp.jpg';
      var file = await FlutterImageCompress.compressAndGetFile(
          image.absolute.path, targetPath,
          quality: 88);
      if (file == null) {
        return "";
      }
      // print("Image Size after Image cruncher in bytes: ");
      // print(await file.length());
      EasyLoading.show();
      Reference ref =
          storage.ref().child("$folder/${DateTime.now().toString()}");
      UploadTask uploadTask = ref.putData(await file.readAsBytes(),
          SettableMetadata(contentType: 'image/jpeg'));
      var res = await uploadTask;
      link = await res.ref.getDownloadURL();
      EasyLoading.dismiss();
    } catch (_) {
      log(_.toString());
      EasyLoading.showError(_.toString());
    }
    return link;
  }

  Future<String> uploadVideo(String folder, File image) async {
    String link = "";
    try {
      if (image.path == "") return link;
      EasyLoading.show();
      Reference ref =
          storage.ref().child("$folder/${DateTime.now().toString()}");
      UploadTask uploadTask = ref.putData(await image.readAsBytes(),
          SettableMetadata(contentType: 'video/mp4'));
      var res = await uploadTask;
      link = await res.ref.getDownloadURL();
      EasyLoading.dismiss();
    } catch (_) {
      log(_.toString());
      EasyLoading.showError(_.toString());
    }
    return link;
  }

  Future<bool> deletePic(String url) async {
    try {
      EasyLoading.show();
      await FirebaseStorage.instance.refFromURL(url).delete();
      EasyLoading.dismiss();
      return true;
    } catch (e) {
      EasyLoading.showError("Error deleting db from cloud: $e");
      return false;
    }
  }
}
