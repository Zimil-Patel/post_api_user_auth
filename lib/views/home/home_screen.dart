import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_api_user_auth/views/auth/auth_screen.dart';
import 'package:post_api_user_auth/views/details/detail_screen.dart';

import 'components/smart_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (userController.currentUser == null) {
      userController.getCurrentUser();
    }


    log("Building home");
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${userController.currentUser!.firstName} ${userController.currentUser!.lastName}"),
        actions: [
          IconButton(
              onPressed: () {
                userController.setLogInStatus(false);
                userController.currentUser = null;
                Get.offAndToNamed('/auth');
              },
              icon: const Icon(Icons.login_rounded))
        ],
      ),

      body: Obx(
        () => ListView.builder(
            itemCount: userController.userList.length,
            itemBuilder: (context, index) {
              final user = userController.userList[index];
              return GestureDetector(
                onTap: (){
                  Get.to(() => DetailScreen(user: user));
                },
                child: smartContainer(
                  Row(
                    children: [
                      // IMAGE
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(user.image),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // FIRST LAST NAME
                            Text(
                              "${user.firstName} ${user.lastName}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            // EMAIL
                            Text(
                              user.email,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white54,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),

    );
  }
}



