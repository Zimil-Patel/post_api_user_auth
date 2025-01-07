import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_api_user_auth/controller/user_controller.dart';

import 'components/login_button.dart';

UserController userController = Get.put(UserController());

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/users');
            },
            icon: const Icon(Icons.save_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // EMAIL
              _customInputField(
                  controller: userController.userCtrl,
                  hintText: 'Enter your email',
                  icon: Icons.person),

              const SizedBox(height: 12),

              // PASSWORD
              _customInputField(
                  controller: userController.passCtrl,
                  hintText: 'Enter your password',
                  icon: Icons.lock_rounded),

              const SizedBox(height: 20),

              // LOGIN IN BUTTON
              loginButton(),
            ],
          ),
        ),
      ),
    );
  }

}

TextField _customInputField(
    {required String hintText,
    required TextEditingController controller,
    required IconData icon}) {
  return TextField(
    onTapOutside: (event) {
      FocusManager.instance.primaryFocus!.unfocus();
    },
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      suffixIcon: IconButton(
          onPressed: (){
            controller.clear();
          },
          icon: const Icon(Icons.highlight_remove_rounded)),
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );
}
