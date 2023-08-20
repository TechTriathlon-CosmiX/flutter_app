import 'package:get/get.dart';

class SpaceLinesController extends GetxController {

  // @override // fetch possible travel locations from back end on initialization
  // void onInit() {
  //   super.onInit();
  //   fetchAllSpaceLines();
  // }

 List<SpaceLine> spaceLines = [
    SpaceLine(
        DateTime(2163, 10, 31), DateTime(2163, 10, 31,15, 30), "United Kingdom",
        'Galactic Skyways Express', '4', '6'),
    SpaceLine(
        DateTime(2163, 11, 15), DateTime(2163, 11, 15,10, 45,), "Mars Colony Alpha",
        'Cosmic Journeys', '7', '10'),
    SpaceLine(
        DateTime(2164, 3, 22), DateTime(2164, 3, 22,8, 0), "Lunar Outpost Theta",
        'Star Odyssey Flights', '2', '5'),
    SpaceLine(
        DateTime(2164, 6, 7), DateTime(2164, 6, 7,19, 15), "Jupiter Orbital Station",
        'AstraNautica Lines', '12', '15'),
  ];

  // void fetchAllSpaceLines() async {
  //   try {
  //     spaceLines = await _apiService.fetchTravelLocations();
  //     planets = locations;
  //   } catch (e) {
  //     // Handle error, e.g., show a toast or error message
  //   }
  // }
 
}

class SpaceLine {
  DateTime date;
  DateTime time;
  String country;
  String spaceline;
  String cost;
  String duration;
  SpaceLine(
      this.date, this.time, this.country, this.spaceline, this.cost, this.duration);
}

