import 'package:CosmiX/models/planet.dart';
import 'package:CosmiX/services/api_service.dart';
import 'package:CosmiX/widgets/bottom_sheet_panel.dart';
import 'package:get/get.dart';

enum PassengerType { adult, children, infant }

extension PassengerTypeExtension on PassengerType {
  String get label {
    return toString().split('.').last[0].toUpperCase() +
        toString().split('.').last.substring(1);
  }
}

class BookingFilterController extends GetxController {
  final ApiService _apiService = ApiService();

  @override // fetch possible travel locations from back end on initialization
  void onInit() {
    super.onInit();
    // fetchTravelLocations();
  }

  // Future<void> fetchTravelLocations() async {
  //   try {
  //     planets = await _apiService.fetchAllPlanets();
  //   } catch (e) {
  //     // Handle error, e.g., show a toast or error message
  //   }
  // }

  List<Planet> planets = [
    Planet(
        planetId: '1',
        planetName: 'Venus',
        planetImage: 'venus',
        planetDescription: 'E Space launch #2 - CA, USA'),
    Planet(
        planetId: '2',
        planetName: 'Earth',
        planetImage: 'earth',
        planetDescription: 'E Space launch #2 - CA, USA'),
    Planet(
        planetId: '3',
        planetName: 'Mars',
        planetImage: 'mars',
        planetDescription: 'E Space launch #2 - CA, USA'),
    Planet(
        planetId: '4',
        planetName: 'Jupiter',
        planetImage: 'jupiter',
        planetDescription: 'E Space launch #2 - CA, USA'),
    Planet(
        planetId: '5',
        planetName: 'Saturn',
        planetImage: 'saturn',
        planetDescription: 'E Space launch #2 - CA, USA'),
    Planet(planetId: '6',
      planetName: 'Uranus',
      planetImage: 'uranus',
      planetDescription: 'E Space launch #2 - CA, USA'),
    Planet(planetId: '7',
      planetName: 'Neptune',
      planetImage: 'neptune',
      planetDescription: 'E Space launch #2 - CA, USA'),
    ];

  Rx<Planet> filterFromSpacePort = Planet(planetId: '2',
      planetName: 'Earth',
      planetImage: 'earth',
      planetDescription: 'E Space launch #2 - CA, USA').obs;
  Rx<Planet> filterToSpacePort = Planet(planetId: '2',
      planetName: 'Earth',
      planetImage: 'earth',
      planetDescription: 'E Space launch #2 - CA, USA').obs;
  Rx<DateTime>? departureTime = DateTime.now().obs;
  Rx<DateTime>? arrivalTime = DateTime.now().obs;

  Rx<String>? selectedFlightId;
  Rx<List<String>>? selectedCabinIds;
  Rx<int> additionalLuggageCapacity = 0.obs;
  Rx<double> additionalLuggageCharge = 0.0.obs;
  Rx<double> netValue = 0.0.obs;
  Rx<double> paymentAmount = 0.0.obs;

  Rx<String>? departureDateAsText;
  Rx<String>? departureTimeAsText;
  Rx<String>? arrivalDateAsText;
  Rx<String>? arrivalTimeAsText;

  var adultCount = 0.obs;
  var childrenCount = 0.obs;
  var infantCount = 0.obs;

  // Future<bool> makeBooking() async {
  //   try {
  //     bool success = await _apiService.postBooking(
  //       // Provide the required parameters
  //       placedTime: DateTime.now(),
  //       adultCount: adultCount.value,
  //       childCount: childrenCount.value,
  //       additionalRemarks: 'Additional remarks here',
  //       additionalLuggageCapacity: 2,
  //       additionalLuggageCharge: 20.0,
  //       netValue: 250.0,
  //       flightId: selectedFlightId!.value,
  //       cabinIds: selectedCabinIds!.value,
  //       paymentAmount: 300.0,
  //     );
  //
  //     if (success) {
  //       // Handle success
  //       return true;
  //     } else {
  //       // Handle failure
  //       return false;
  //     }
  //   } catch (error) {
  //     // Handle exceptions or errors
  //     return false;
  //   }
  // }

  void updateCounts(PassengerType type, int value) {
    switch (type) {
      case PassengerType.adult:
        adultCount(value);
        break;
      case PassengerType.children:
        childrenCount(value);
        break;
      case PassengerType.infant:
        infantCount(value);
        break;
    }

    update();
  }

  void changePlanet(BottomSheetInitiatorType initiator, Planet planet) {
    switch (initiator) {
      case BottomSheetInitiatorType.toButton:
        filterToSpacePort(planet);
        break;
      case BottomSheetInitiatorType.fromButton:
        filterFromSpacePort(planet);
        break;
      default:
        break;
    }

    update();
  }

  changeDepartureTime(BottomSheetInitiatorType initiator, DateTime dateTime) {
    switch (initiator) {
      case BottomSheetInitiatorType.departureTime:
        departureTime = dateTime.obs;
        departureDateAsText = "${departureTime!.value.year}-${departureTime!.value.month.toString().padLeft(2, '0')}-${departureTime!.value.day.toString().padLeft(2, '0')}".obs;
        departureTimeAsText = "${departureTime!.value.hour.toString().padLeft(2, '0')}:${departureTime!.value.minute.toString().padLeft(2, '0')}".obs;
        break;
      case BottomSheetInitiatorType.arrivalTime:
        arrivalTime = dateTime.obs;
        arrivalDateAsText = "${arrivalTime!.value.year}-${arrivalTime!.value.month.toString().padLeft(2, '0')}-${arrivalTime!.value.day.toString().padLeft(2, '0')}".obs;
        arrivalTimeAsText = "${arrivalTime!.value.hour.toString().padLeft(2, '0')}:${arrivalTime!.value.minute.toString().padLeft(2, '0')}".obs;
        break;
      default:
        break;
    }

    // print(dateTime);
    print(departureDateAsText);
    update();
  }
}
