import 'package:CosmiX/models/login_request.dart';
import 'package:CosmiX/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/login_response.dart';
import '../services/api_service.dart';
import '../services/auth_service.dart';

class LoginController extends GetxController {
  final ApiService _apiService = ApiService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isLoginLoading = false.obs;

  Future<bool> login() async {
    // check if all fields are filled
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in all fields',
        backgroundColor: Colors.red.withOpacity(0.6),
        colorText: CosmixColor.white,
      );
      return false;
    }

    isLoginLoading.value = true;

    LoginRequest loginRequest = LoginRequest(
        email: emailController.text, password: passwordController.text);
    try {
      final response = await _apiService.sendPostRequest(
        false, // Authentication is not required for login
        '/auth/login',
        data: loginRequest.toJson(),
      );

      isLoginLoading.value = false;

      if (response == null) {
        return false;
      }

      if (response.statusCode != 200) {
        return false;
      }

      if (response.statusCode == 403) {
        Get.snackbar(
          'Error',
          'Invalid email or password',
          colorText: Colors.white,
        );
      }

      // Assuming the response contains authentication-related data
      LoginResponse loginResponse = LoginResponse.fromJson(response.body);

      final authService = Get.find<AuthService>();
      authService.setUserEmail(loginResponse.email);
      authService.setAuthentication(true);
      authService.updateBearerToken(loginResponse.bearerToken);

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  void onClose() {
    // Dispose of the controllers when the controller is closed
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
