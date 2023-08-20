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
  final List<TravelLocation> planets = [TravelLocation('Venus','E Space launch #2 - CA, USA'),
    TravelLocation('Earth','E Space launch #2 - CA, USA'),
    TravelLocation('Mars','E Space launch #2 - CA, USA'),
    TravelLocation('Jupiter','E Space launch #2 - CA, USA'),
    TravelLocation('Saturn','E Space launch #2 - CA, USA'),
    TravelLocation('Uranus','E Space launch #2 - CA, USA'),
    TravelLocation('Neptune','E Space launch #2 - CA, USA'),
    ];
  Rx<TravelLocation> filterFromSpacePort = TravelLocation('Earth','E Space launch #2 - CA, USA').obs;
  Rx<TravelLocation> filterToSpacePort = TravelLocation('Earth','E Space launch #2 - CA, USA').obs;
  Rx<DateTime> departureTime = DateTime.now().obs;
  Rx<DateTime> arrivalTime = DateTime.now().obs;
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
        departureTime(dateTime);
        break;
      case BottomSheetInitiatorType.arrivalTime:
        arrivalTime(dateTime);
        break;
      default:
        break;
    }

    update();
  }
}

class TravelLocation{
  String planetName;
  String portName;

  TravelLocation(this.planetName, this.portName);
}