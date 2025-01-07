import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_api_user_auth/services/api_service.dart';
import 'package:post_api_user_auth/views/auth/auth_screen.dart';

  Row loginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
        () => !userController.isLoading.value ? CupertinoButton(
            onPressed: () async {
              final userName = userController.userCtrl.text;
              final password = userController.passCtrl.text;
              userController.isLoading.value = true;
              final result = await ApiService.service.verifyUser(userName, password);
              if(result){
                Get.offAndToNamed('/home');
                userController.clearController();
              }
              userController.isLoading.value = false;
            },
            padding: EdgeInsets.zero,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 14, horizontal: 40),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey,
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),
          ) : const CircularProgressIndicator(color: Colors.grey,)
        ),
      ],
    );
  }
