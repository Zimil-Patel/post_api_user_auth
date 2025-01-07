import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_api_user_auth/views/auth/auth_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    if(userController.currentUser == null){
      userController.getCurrentUser();
    }

    log("Building home");
    return Scaffold(
      appBar: AppBar(
        title: Text("${userController.currentUser!.firstName} ${userController.currentUser!.lastName}"),
        actions: [
          IconButton(onPressed: (){
            userController.setLogInStatus(false);
            userController.currentUser = null;
            Get.offAndToNamed('/auth');
          }, icon: const Icon(Icons.login_rounded))
        ],
      ),

      body: const SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(radius: 20,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
