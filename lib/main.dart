import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:post_api_user_auth/views/auth/auth_screen.dart';
import 'package:post_api_user_auth/views/auth/saved_user_screen.dart';
import 'package:post_api_user_auth/views/home/home_screen.dart';

// Placement Task Day - 2
// Users API: https://dummyjson.com/users
// Auth API: https://dummyjson.com/auth/login
//
// - Create a Login System App
// - Allow only Users API's user to log in and authenticate users using Auth API.
// - Auth API supports POST type and takes references from this doc: https://dummyjson.com/docs/auth
// - After successfully logging in, navigate the user to the homepage where he should show their basic detail in Listview and after clicking open another detail page.
// - Set a logout button which navigates the user to the login page again.
// - Also store all user details(all) that are logged in successfully in permanent storage without using SQLite & Firebase.
// - Create attractive UI & Proper directory structure

Future<void> main() async {
  await GetStorage.init();
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
        GetPage(name: '/home', page: () => const HomeScreen()),
      ],
      initialRoute:
          GetStorage().read('isLoggedIn') ?? false ? '/home' : '/auth',
    );
  }
}
