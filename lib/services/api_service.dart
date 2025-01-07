import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:post_api_user_auth/views/auth/auth_screen.dart';

class ApiService{
  ApiService._instance();
  static ApiService service = ApiService._instance();

  // CALL USER API
  Future<String> fetchUserApi(String? url) async {
    Uri uri = Uri.parse(url ?? 'https://dummyjson.com/users');
    try{
      final response = await http.get(uri);
      if(response.statusCode == 200) {
        log('User api called successfully...');
        return response.body;
      } else {
        log('Failed with code: ${response.statusCode}');
      }
    } catch(e){
      log('Failed to fetch user api!');
    }

    return '';
  }

  
  // VERIFY USER USING AUTH API
  Future<bool> verifyUser(String userName, password) async {
    Uri uri = Uri.parse("https://dummyjson.com/auth/login");

    try{
      final response = await http.post(
          uri,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "username": userName,
            "password": password
          }),
      );
      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        log("ID: ${data['id']}");
        await userController.setCurrentUser(data['id']);
        await userController.setLogInStatus(true);
        return true;
      } else if(response.statusCode == 400){
        final data = jsonDecode(response.body);
        Get.snackbar('Failed', data['message']);
      } else {
        log("Request Failed");
        Get.snackbar('Failed', 'Request failed');
      }
    } catch(e) {
      log("Failed to post request! : $e");
    }

    return false;

  }

}