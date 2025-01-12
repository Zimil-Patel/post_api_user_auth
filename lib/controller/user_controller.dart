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
  List loggedInUserList = [];
  RxList<UserModel> userList = <UserModel>[].obs;
  UserModel? currentUser;
  var userCtrl = TextEditingController();
  var passCtrl = TextEditingController();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getLoggedInUser();
    super.onInit();
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
      log("Got current user: ${currentUser!.username}");
    } catch (e) {
      log("Failed to fetch current user: $e");
    }
  }

  // SET CURRENT USER
  Future<void> setCurrentUser(int id) async {
    try {
      final box = GetStorage();
      final userEndPoint = 'https://dummyjson.com/users/$id';
      box.write('currentUser', await ApiService.service.fetchUserApi(userEndPoint));
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

  // SAVE USER
  Future<void> saveLoggedInUser(int id) async {
    try{
    final userEndPoint = 'https://dummyjson.com/users/$id';
    final user = await ApiService.service.fetchUserApi(userEndPoint);
    bool exist = userList.any((element) => element.id == id);
    if(!exist){
      userList.add(UserModel.fromJson(jsonDecode(user)));
      loggedInUserList.add(user);
      final box = GetStorage();
      box.write('loggedInUserList', loggedInUserList);
    } else {
      log("Already exists");
    }

    } catch (e) {
      log("Failed to save user");
    }
  }

  // GET LOGGED USER LIST
  void getLoggedInUser(){
    final box = GetStorage();
    loggedInUserList = box.read('loggedInUserList') ?? [];
    userList.value = loggedInUserList.map((e) => UserModel.fromJson(jsonDecode(e))).toList();
    log("Got loggedUser List: $userList");
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
