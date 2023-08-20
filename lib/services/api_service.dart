import 'dart:convert';
import 'package:CosmiX/models/planet.dart';
import 'package:CosmiX/util/constants.dart';
import 'package:http/http.dart' as http;


class ApiService {

  Future<List<Planet>> fetchAllPlanets() async {
    final response = await http.get(Uri.parse('$baseUrl/allplanets'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Planet.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<bool> postBooking({
    required DateTime placedTime,
    required int adultCount,
    required int childCount,
    required String additionalRemarks,
    required int additionalLuggageCapacity,
    required double additionalLuggageCharge,
    required double netValue,
    required String flightId,
    required List<String> cabinIds,
    required double paymentAmount,
  }) async {
    final url = Uri.parse('$baseUrl/bookings');

    Map<String, dynamic> requestBody = {
      'placedTime': placedTime.toIso8601String(),
      'adultCount': adultCount,
      'childCount': childCount,
      'additionalRemarks': additionalRemarks,
      'additionalLuggageCapacity': additionalLuggageCapacity,
      'additionalLuggageCharge': additionalLuggageCharge,
      'netValue': netValue,
      'flightId': flightId,
      'cabinIds': cabinIds,
      'paymentAmount': paymentAmount,
    };

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Booking created successfully');
      return true;
    } else {
      print('Error creating booking: ${response.body}');
      return false;
    }
  }

  // Future<List<SpaceLine>> fetchSpaceLines() async {
  //   final response = await http.get(Uri.parse('$baseUrl/spacelines'));
  //   if (response.statusCode == 200) {
  //     final List<dynamic> data = json.decode(response.body);
  //     return data.map((item) => SpaceLine.fromJson(item)).toList();
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }
}


