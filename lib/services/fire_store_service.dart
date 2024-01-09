import 'dart:developer';


import 'package:datingapp/api/fire_store_api.dart';
import 'package:datingapp/models/user_model.dart';

import 'global.dart';

class FirestoreServices {
  final FirestoreApi _instance = FirestoreApi();

  registerUser() async {
    await _instance.postANode(
        path: 'userProfile/${currentUser.id}', data: currentUser.toJSON());
  }

  getMyUser(id) async {
    MyResponse response = await _instance.fetchANode(path: 'userProfile/$id');
    currentUser = response.data;
  }

  onlineStatus(bool status) async {
    if (currentUser.id != "") {
      await _instance.updateANode(
          path: "userProfile/${currentUser.id}", data: {"online": status});
    } else {
      log('currentUser.id is empty on onlineStatus: $status');
    }
  }

  updateUser(UserModel user) async {
    try {
      Map<String, Object?> mydata = user.toJSON();
      await _instance.updateANode(path: 'userProfile/${user.id}', data: mydata);
    } catch (_) {
      print(_);
    }
  }

  searchUsers(String key) {
    return _instance.fetchCollectionSnapshort(path: 'userProfile');
  }

  Future<UserModel?> getUser(String uId) async {
    if (allUsers.where((UserModel e) => e.id == uId).isEmpty) {
      MyResponse response =
          await _instance.fetchANode(path: 'userProfile/$uId');
      if (response.success) {
        UserModel user = UserModel.toModel(response.data);
        allUsers.add(user);
        return user;
      }
      return null;
    } else {
      return allUsers.where((UserModel e) => e.id == uId).first;
    }
  }

  checkUserNameExit(String userName) async {
    List<dynamic> list = await _instance
        .fetchCollection(path: 'userProfile', filter: {'userName': userName});
    if (list.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}

class MyResponse {
  bool success;
  dynamic data;
  MyResponse({this.success = false, this.data});
}
