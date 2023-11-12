import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:oopacks/constants/api_endpoints.dart';
import 'package:oopacks/models/request_models.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      contentType: 'Application/json',
      baseUrl: NetworkConstants().baseUrl,
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 5000),
    ),
  );



  ApiService._();
  // Singleton instance
  static final ApiService _instance = ApiService._();
  factory ApiService() {
    return _instance;
  }

  Future<bool> registerUser({
    required RegistrationRequest registrationRequest
  }) async {
    try {
      debugPrint('registerUserRequest ${ jsonEncode(registrationRequest)} url ${NetworkConstants().baseUrl}${NetworkConstants().userRegistrationUrl}');

      final Response response = await _dio.post(
        NetworkConstants().userRegistrationUrl,
        data: jsonEncode(registrationRequest),
      );
      if(response.data != null){
        return true;
      }
      return false;
      // Handle the response
    } catch (e,stack) {
      debugPrint('ExceptionCaughtAt registerUserFn $e \n stack $stack');
      return false;
    }
  }



  Future<bool> loginUser({
    required LoginRequest loginRequest
  }) async {
    try {
      debugPrint('LoginData ${loginRequest.toJson()} url ${NetworkConstants().baseUrl}${NetworkConstants().loginUrl}');

      final Response response = await _dio.post(
        NetworkConstants().loginUrl,
        data: jsonEncode(loginRequest),
        options: Options(
          method: 'POST',
          contentType: 'Application/json'
        )
      );
     if(response.data != null){
        return true;
      }
      return false;
      // Handle the response
    } catch (e,stack) {
      debugPrint('ExceptionCaughtAt ResetPasswordFn $e \n stack $stack');
      return false;
    }
  }

  Future<bool> resetPassword({
    required LoginRequest loginRequest
  }) async {
    try {
      debugPrint('restPassword ${loginRequest.toJson()} url ${NetworkConstants().baseUrl}${NetworkConstants().forgotPasswordUrl}');

      final Response response = await _dio.put(
          NetworkConstants().forgotPasswordUrl,
          data: jsonEncode(loginRequest),
      );
      if(response.data != null){
        return true;
      }
      return false;
      // Handle the response
    } catch (e,stack) {
      debugPrint('ExceptionCaughtAt LoginUserFn $e \n stack $stack');
      return false;
    }
  }
}
