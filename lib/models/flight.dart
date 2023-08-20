class Flight {
  String id;
  DateTime departureTime;
  DateTime arrivalTime;
  String flightStatus;
  int freeCabinCount;
  String arrivalSpacePort;
  String departureSpacePort;
  String spaceShip;
  String flightClasses;
  String bookings;

  Flight({required this.id,
  required this.departureTime,
  required this.arrivalTime,
  required this.flightStatus,
  required this.freeCabinCount,
  required this.arrivalSpacePort,
  required this.spaceShip,
  required this.departureSpacePort,
  required this.flightClasses,
  required this.bookings});


}