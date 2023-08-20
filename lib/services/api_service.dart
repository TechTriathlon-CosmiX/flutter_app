import 'package:get/get_connect.dart';

class ApiService extends GetConnect {
  // Define the base URL here
  final baseUrl = 'http://localhost:3001/api';

  Future<Response> registerUser(Map<String, dynamic> data) async {
    return post('$baseUrl/auth/register', data);
  }

  Future<Response> loginUser(Map<String, dynamic> data) async {
    return post('$baseUrl/auth/login', data);

  Future<List<TravelLocation>> fetchTravelLocations() async {
    final response = await http.get(Uri.parse('$baseUrl/spaceports'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => TravelLocation.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<bool> postBooking({
    required TravelLocation startLocation,
    required TravelLocation endLocation,
    required int adultCount,
    required int childrenCount,
    required int infantCount,
    required double charge,
    required String airline,
    required String selectedPackage,
  }) async {
    final url = Uri.parse('$baseUrl/bookings');

    final Map<String, dynamic> requestBody = {
      'startLocation': startLocation.toJson(),
      'endLocation': endLocation.toJson(),
      'adultCount': adultCount,
      'childrenCount': childrenCount,
      'infantCount': infantCount,
      'charge': charge,
      'airline': airline,
      'selectedPackage': selectedPackage,
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
}
