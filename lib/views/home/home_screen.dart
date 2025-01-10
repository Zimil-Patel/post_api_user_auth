import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_api_user_auth/model/user_model.dart';
import 'package:post_api_user_auth/views/auth/auth_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (userController.currentUser == null) {
      userController.getCurrentUser();
    }

    final UserModel user = userController.currentUser!;

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            _smartContainer(
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

                  const Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey,),
                ],
              ),
            ),

            // // Address
            // _smartContainer(
            //   Row(
            //     children: [
            //       Flexible(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           mainAxisSize: MainAxisSize.min,
            //           children: [
            //             const Text(
            //               "Address",
            //               style: TextStyle(
            //                 fontSize: 20,
            //                 color: Colors.white54,
            //                 fontWeight: FontWeight.w600,
            //               ),
            //             ),
            //             const SizedBox(height: 12,),
            //             Text(
            //               "${user.address.address}, ${user.address.city}, ${user.address.state}",
            //               style: const TextStyle(
            //                 fontSize: 18,
            //                 fontWeight: FontWeight.w600,
            //               ),
            //             ),
            //             _buildRichText(label: 'state code', value: user.address.stateCode),
            //             _buildRichText(label: 'postal code', value: user.address.postalCode),
            //             _buildRichText(label: 'country', value: user.address.country),
            //             _buildRichText(label: 'coordinates', value: "lat: ${user.address.coordinates.lat}, lng: ${user.address.coordinates.lng}"),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

Widget _smartContainer(Widget child) {
  return Container(
    padding: const EdgeInsets.all(12),
    margin: const EdgeInsets.symmetric(vertical: 12),
    decoration: BoxDecoration(
      color: Colors.white12,
      borderRadius: BorderRadius.circular(20),
    ),
    child: child,
  );
}

RichText _buildRichText({required String label, value}) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: '$label: ',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.white54,
          ),
        ),
        TextSpan(
          text: value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}
