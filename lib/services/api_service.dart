import 'dart:async';
import 'dart:io';

import 'package:CosmiX/util/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../theme/colors.dart';
import 'auth_service.dart';

class ApiService extends GetConnect {
  // Future<List<Planet>> fetchAllPlanets() async {
  //   final response = await http.get(Uri.parse('$baseUrl/allplanets'));
  //   if (response.statusCode == 200) {
  //     final List<dynamic> data = json.decode(response.body);
  //     return data.map((item) => Planet.fromJson(item)).toList();
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }
  //
  // Future<bool> postBooking({
  //   required DateTime placedTime,
  //   required int adultCount,
  //   required int childCount,
  //   required String additionalRemarks,
  //   required int additionalLuggageCapacity,
  //   required double additionalLuggageCharge,
  //   required double netValue,
  //   required String flightId,
  //   required List<String> cabinIds,
  //   required double paymentAmount,
  // }) async {
  //   final url = Uri.parse('$baseUrl/bookings');
  //
  //   Map<String, dynamic> requestBody = {
  //     'placedTime': placedTime.toIso8601String(),
  //     'adultCount': adultCount,
  //     'childCount': childCount,
  //     'additionalRemarks': additionalRemarks,
  //     'additionalLuggageCapacity': additionalLuggageCapacity,
  //     'additionalLuggageCharge': additionalLuggageCharge,
  //     'netValue': netValue,
  //     'flightId': flightId,
  //     'cabinIds': cabinIds,
  //     'paymentAmount': paymentAmount,
  //   };
  //
  //   final response = await http.post(
  //     url,
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //     body: jsonEncode(requestBody),
  //   );
  //
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     print('Booking created successfully');
  //     return true;
  //   } else {
  //     print('Error creating booking: ${response.body}');
  //     return false;
  //   }
  // }

  // Future<List<SpaceLine>> fetchSpaceLines() async {
  //   final response = await http.get(Uri.parse('$baseUrl/spacelines'));
  //   if (response.statusCode == 200) {
  //     final List<dynamic> data = json.decode(response.body);
  //     return data.map((item) => SpaceLine.fromJson(item)).toList();
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  final AuthService _authService =
      Get.find(); // Get a reference to the AuthService

  @override
  void onInit() {
    print("init");
    super.onInit();
    httpClient.baseUrl = baseUrl;
    httpClient.timeout = const Duration(seconds: 10);
  }

  // Function to send a GET request
  Future<Response<T>> sendGetRequest<T>(
    bool isAuthRequired,
    String endpoint, {
    Map<String, String>? headers = const {},
    Map<String, dynamic>? query = const {},
    T Function(dynamic)? decoder,
  }) async {
    try {
      final response = await get(
        endpoint,
        headers: {
          ...headers ?? {},
          // Keep any existing headers
          if (isAuthRequired)
            'Authorization': 'Bearer ${_authService.getBearerToken()}',
          // Add the bearer token header
        },
        query: query,
        decoder: decoder,
      );

      if (kDebugMode) {
        print(response);
      }

      if (response.statusCode == 401) {
        throw ForceLogoutException("Error: 401 Unauthorized");
      }

      return response;
    } catch (error) {
      _handleError(error);
      rethrow;
    }
  }

  // Function to send a POST request
  Future<Response<T>?> sendPostRequest<T>(
    bool isAuthRequired,
    String endpoint, {
    dynamic data,
    Map<String, String>? headers = const {},
    Map<String, dynamic>? query = const {},
    T Function(dynamic)? decoder,
  }) async {
    try {
      final response = await post(
        baseUrl + endpoint,
        data,
        headers: {
          ...headers ?? {},
          // Keep any existing headers
          if (isAuthRequired)
            'Authorization': 'Bearer ${_authService.getBearerToken()}',
          // Add the bearer token header
        },
        query: query,
        decoder: decoder,
      );

      if (kDebugMode) {
        print(response.body);
      }

      if (response.statusCode == 401) {
        throw ForceLogoutException("Error: 401 Unauthorized");
      }

      return response;
    } catch (error) {
      _handleError(error);
      // rethrow;
      return null;
    }
  }

  void _handleError(dynamic error) {
    if (error is SocketException) {
      // Handle network/socket errors
      Get.snackbar(
        'Error',
        'Network error occurred',
        colorText: CosmixColor.white,
      );
    } else if (error is TimeoutException) {
      // Handle timeout errors
      Get.snackbar(
        'Error',
        'Request timed out',
        colorText: CosmixColor.white,
      );
    } else {
      if (kDebugMode) {
        print(error);
      }
      // Handle other errors
      Get.snackbar(
        'Error',
        'An error occurred',
        colorText: CosmixColor.white,
      );

      // Check if the error indicates a need for force logout
      if (error is ForceLogoutException) {
        _authService.forceLogout();
      }
    }
  }
}

class ForceLogoutException implements Exception {
  final String message;

  ForceLogoutException(this.message);

  @override
  String toString() {
    return 'ForceLogoutException: $message';
  }
}
