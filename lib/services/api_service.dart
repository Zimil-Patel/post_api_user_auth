import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService{
  ApiService._instance();
  static ApiService service = ApiService._instance();

  // CALL USER API
  Future<String> fetchUserApi(String? url) async {
    Uri uri = Uri.parse(url ?? 'https://dummyjson.com/users');
    try{
      Response response = await http.get(uri);
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
  void verifyUser(String email, password){
    Uri uri = Uri.parse("https://dummyjson.com/auth/login");
    // final response = http.post();
  }

}