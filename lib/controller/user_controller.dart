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
  RxList<UserModel> loggedInUserList = <UserModel>[].obs;
  UserModel? currentUser;
  var userCtrl = TextEditingController();
  var passCtrl = TextEditingController();
  RxBool isLoading = false.obs;

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
      log("Got current user: ${currentUser!.username}");
    } catch (e) {
      log("Failed to fetch current user: $e");
    }
  }

  // SET CURRENT USER
  Future<void> setCurrentUser(int id) async {
    try {
      final box = GetStorage();
      final user =
          await ApiService.service.fetchUserApi('https://dummyjson.com/users/$id');
      log(user);
      var verifiedUserList = box.read('verifiedUserList') ?? [];
      log("Got List: $verifiedUserList");
      // save list to rxList
      for(var i in verifiedUserList){

      }

      // check if given user is already logged in before
      bool isContain = false;
      for(var i in verifiedUserList){
        if (id == i['id']){
          isContain = true;
          break;
        }
      }

      // if not contain then add this user to logged in list
      if(!isContain){

      }
    } catch (e) {
      log("Failed to set current user $e");
    }
    if(savedUserList.isEmpty){
      ApiService.service.fetchUserApi(null);
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
  void setControllers(String userName, password) {
    userCtrl.text = userName;
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
