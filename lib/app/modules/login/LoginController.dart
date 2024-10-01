import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftapp/app/utils/colors.dart';

import '../../data/models/Auth.dart';
import '../../routes/routes.dart';
import '../../services/ApiService.dart';
import '../../services/TokenService.dart';


class LoginController extends GetxController {
  // Observables for the form fields
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;
  var isError = false.obs;

  final ApiService _apiService = Get.put(ApiService());
  final TokenService _tokenService = TokenService();

  // Function to handle login action
  void login() async {
    isError.value = false;
    final tokenService = await Get.putAsync(() => TokenService().init());
    await _tokenService.init();
    // Deserialize JSON string to Auth object
    isLoading.value = true;
    try {
      final response = await _apiService.postRequest('/auth', {
        'login': email.value,
        'passcode': password.value,
      });

      var user =  response.data;

      if (user["status"] == "fail"){
        isError.value = true;
        return;
      }else{
        String newToken =  user['body'];
        String oldToken =  _tokenService.getToken().toString();

        if(newToken != oldToken ){
          await _tokenService.removeToken();
          await _tokenService.saveToken(newToken);
        }else{
          await _tokenService.saveToken(newToken);
        }
        Get.offAllNamed(Routes.home);
      }




    } catch (e) {
      // Handle error
      print('Login failed: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void logout() async {
    isLoading.value = true;
    try {
      // Clear token
      // await _tokenService.removeToken();

      // Optionally clear any other session information if necessary

      // Redirect to the login page
      Get.offAllNamed(Routes.login);
    } catch (e) {
      // Handle error
      print('Logout failed: $e');
    } finally {
      isLoading.value = false;
    }
  }
}