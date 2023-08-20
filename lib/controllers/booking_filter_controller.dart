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

  // @override // fetch possible travel locations from back end on initialization
  // void onInit() {
  //   super.onInit();
  //   fetchTravelLocations();
  // }

  Future<void> fetchTravelLocations() async {
    try {
      final List<TravelLocation> locations = await _apiService.fetchTravelLocations();
      planets = locations;
    } catch (e) {
      // Handle error, e.g., show a toast or error message
    }
  }

  List<TravelLocation> planets = [TravelLocation('Venus','E Space launch #2 - CA, USA'),
    TravelLocation('Earth','E Space launch #2 - CA, USA'),
    TravelLocation('Mars','E Space launch #2 - CA, USA'),
    TravelLocation('Jupiter','E Space launch #2 - CA, USA'),
    TravelLocation('Saturn','E Space launch #2 - CA, USA'),
    TravelLocation('Uranus','E Space launch #2 - CA, USA'),
    TravelLocation('Neptune','E Space launch #2 - CA, USA'),
    ];
  Rx<TravelLocation> filterFromSpacePort = TravelLocation('Earth','E Space launch #2 - CA, USA').obs;
  Rx<TravelLocation> filterToSpacePort = TravelLocation('Earth','E Space launch #2 - CA, USA').obs;
  Rx<DateTime>? departureTime = DateTime.now().obs;
  Rx<DateTime>? arrivalTime = DateTime.now().obs;

  Rx<String>? departureDateAsText;
  Rx<String>? departureTimeAsText;
  Rx<String>? arrivalDateAsText;
  Rx<String>? arrivalTimeAsText;

  var adultCount = 0.obs;
  var childrenCount = 0.obs;
  var infantCount = 0.obs;


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

  void changePlanet(BottomSheetInitiatorType initiator, TravelLocation spacePort) {
    switch (initiator) {
      case BottomSheetInitiatorType.toButton:
        filterToSpacePort(spacePort);
        break;
      case BottomSheetInitiatorType.fromButton:
        filterFromSpacePort(spacePort);
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

class TravelLocation{
  String planetName;
  String portName;

  TravelLocation(this.planetName, this.portName);

  factory TravelLocation.fromJson(Map<String, dynamic> json) {
    return TravelLocation(
      json['planetName'],
      json['portName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'planetName': planetName,
      'portName': portName,
    };
  }
}