import 'package:get/get.dart';

enum PassengerType { adult, children, infant }

extension PassengerTypeExtension on PassengerType {
  String get label {
    return toString().split('.').last[0].toUpperCase() +
        toString().split('.').last.substring(1);
  }
}

class PassengerController extends GetxController {
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
}