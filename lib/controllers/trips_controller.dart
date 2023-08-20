import 'package:get/get.dart';

class TripsController extends GetxController {
  final List<Trip> trips = [
    Trip('Earth', 'Mars', DateTime(2163, 10, 31), 'Galactic Skyways Express',
        'Odyssey'),
    Trip('Jupiter', 'Saturn', DateTime(2163, 11, 30),
        'CosmoLuxe Airways', 'Odyssey'),
    Trip('Mars', 'Mercury', DateTime(2163, 12, 30), 'AstralWings Odyssey',
        'Starfire Voyager'),
    Trip('Earth', 'Jupiter', DateTime(2163, 9, 30), 'Galactic Skyways Express',
        'Celestial Odyssey'),
    Trip('Jupiter', 'Neptune', DateTime(2163, 8, 30),
        'NebulaStar Express', 'Odyssey'),
    Trip('Neptune', 'Jupiter', DateTime(2163, 7, 30),
        'Galactic Skyways Express', 'Galactic Horizon'),
  ];
  final List<Memory> memories = [
    Memory('Jupiter', 'Magic Leap'),
    Memory('Neptune', 'Dewy Sea')
  ];
  DateTime filterDate = DateTime(2163, 10, 30);
  List<Trip> upcoming() {
    List<Trip> upcomingTrips = [];
    upcomingTrips =
        trips.where((trip) => trip.date.isBefore(filterDate)).toList();
    return upcomingTrips;
  }

  List<Trip> past() {
    List<Trip> pastTrips = [];
    pastTrips = trips.where((trip) => trip.date.isBefore(filterDate)).toList();
    return pastTrips;
  }
}

class Trip {
  String destination;
  String origin;
  DateTime date;
  String spaceline;
  String spaceship;
  Trip(
      this.destination, this.origin, this.date, this.spaceline, this.spaceship);
}

class Memory {
  String place;
  String planet;
  Memory(this.place, this.planet);
}
