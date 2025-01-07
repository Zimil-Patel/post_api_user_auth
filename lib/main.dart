import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_api_user_auth/views/auth/auth_screen.dart';
import 'package:post_api_user_auth/views/auth/saved_user_screen.dart';

void main(){
  runApp(const UserAuthApi());
}

class UserAuthApi extends StatelessWidget {
  const UserAuthApi({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      getPages: [
        GetPage(name: '/auth', page: () => const AuthScreen()),
        GetPage(name: '/users', page: () => const SavedUserScreen()),
      ],
      home: const AuthScreen(),
    );
  }
}
