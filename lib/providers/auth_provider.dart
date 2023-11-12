import 'package:flutter/material.dart';
import 'package:oopacks/models/request_models.dart';
import 'package:oopacks/utils/shared_preference_helper.dart';
import '../service/api_service.dart';

class AuthProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  Future<bool> loginUser({required LoginRequest loginRequest}) async {
    // You can perform loading state changes here
    try {
      final apiResponse = await _apiService.loginUser(
        loginRequest: loginRequest,
      );
      debugPrint('LoginResponseAtAuthProvider $apiResponse');
      if (apiResponse == true) {
        final setUserLoggedIn = await SharedPreferenceHelper.setUserLoggedIn();
        debugPrint('setUserLoggedInRes $setUserLoggedIn');
        return true;
      }
      return false;
      // Handle success
    } catch (e, stack) {
      // Handle error and update state accordingly
      debugPrint(
          'ExceptionCaughtAt AuthProviderLoginUserFn $e \n stack $stack');

      return false;
    }
  }

  Future<bool> authResetPassword({required LoginRequest loginRequest}) async {
    // You can perform loading state changes here
    try {
      final apiResponse = await _apiService.resetPassword(
        loginRequest: loginRequest,
      );
      debugPrint('ResetPasswordResponseAtAuthProvider $apiResponse');
      if (apiResponse == true) {
        return true;
      }
      return false;
      // Handle success
    } catch (e, stack) {
      // Handle error and update state accordingly
      debugPrint(
          'ExceptionCaughtAt AuthProviderResetPasswordFn $e \n stack $stack');

      return false;
    }
  }

  Future<bool> authResisterUser(
      {required RegistrationRequest registrationRequest}) async {
    // You can perform loading state changes here
    try {
      final apiResponse = await _apiService.registerUser(
        registrationRequest: registrationRequest,
      );
      debugPrint('RegisterUserResponseAtAuthProvider $apiResponse');
      if (apiResponse == true) {
        final setUserLoggedIn = await SharedPreferenceHelper.setUserLoggedIn();
        debugPrint('setUserLoggedInRes $setUserLoggedIn');
        return true;
      }
      return false;
      // Handle success
    } catch (e, stack) {
      // Handle error and update state accordingly
      debugPrint(
          'ExceptionCaughtAt AuthProviderAuthResisterUserFn $e \n stack $stack');

      return false;
    }
  }
}
