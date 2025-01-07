import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UserController extends GetxController{
  // List of saved user from api
  List savedUserList = [];
  var emailCtrl = TextEditingController();
  var passCtrl = TextEditingController();


  // Clear controller
  void clearController(){
    emailCtrl.clear();
    passCtrl.clear();
  }

  // Set controller
  void setControllers(String email, password){
    emailCtrl.text = email;
    passCtrl.text = password;
  }
}