import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:post_api_user_auth/model/user_model.dart';
import 'package:post_api_user_auth/services/api_service.dart';

class UserController extends GetxController {
  // List of saved user from api
  List<UserModel> savedUserList = [];
  UserModel? currentUser;
  var userCtrl = TextEditingController();
  var passCtrl = TextEditingController();

  bool get isLoggedIn => getLoginStatus();

  // GET LOGIN STATUS
  bool getLoginStatus() {
    final box = GetStorage();
    try {
      final result = box.read('isLoggedIn') ?? false;
      log("Login status set to: $isLoggedIn");
      if (result) {
        getCurrentUser();
      } else {
        currentUser = null;
      }
      return result;
    } catch (e) {
      log("Failed to get login status!: $e");
    }
    return false;
  }

  // SET LOGIN STATUS
  Future<void> setLogInStatus(bool value) async {
    final box = GetStorage();
    try {
      await box.write('isLoggedIn', value);
      log("Login status set to: $value");
    } catch (e) {
      log("Failed to set login status!: $e");
    }
  }

  // GET CURRENT USER
  void getCurrentUser() {
    try {
      final box = GetStorage();
      final result = box.read('currentUser');
      final data = jsonDecode(result);
      currentUser = UserModel.fromJson(data);
    } catch (e) {
      log("Failed to fetch current user");
    }
  }

  // SET CURRENT USER
  void setCurrentUser(int id) {
    try {
      final box = GetStorage();
      final user =
          ApiService.service.fetchUserApi('https://dummyjson.com/users/$id');
      log(user as String);
      box.write('currentUser', user);
    } catch (e) {
      log("Failed to set current user");
    }
    for(UserModel e in savedUserList){
      if(e.id == id){
        currentUser = e;
      }
    }
  }

  // Clear controller
  void clearController() {
    userCtrl.clear();
    passCtrl.clear();
  }

  // Set controller
  void setControllers(String email, password) {
    userCtrl.text = email;
    passCtrl.text = password;
  }

  // Fetch user api
  Future<List> fetchUsers() async {
    final result = await ApiService.service.fetchUserApi(null);
    if (result.isNotEmpty) {
      final data = jsonDecode(result);
      // FETCH USERS LIST
      savedUserList =
          (data['users'] as List).map((e) => UserModel.fromJson(e)).toList();
      // for (UserModel element in savedUserList) {
      //   log("id = ${element.id}");
      // }
    }
    return [];
  }
}
