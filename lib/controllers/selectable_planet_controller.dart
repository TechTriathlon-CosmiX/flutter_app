import 'package:get/get.dart';

class SelectablePlanetsController extends GetxController {
  RxList<String> selectedPlanets = <String>[].obs;
  final RxList<String> planets = <String>[
    'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune'
  ].obs;

  void togglePlanetSelection(String planetName) {
    if (selectedPlanets.contains(planetName)) {
      selectedPlanets.remove(planetName);
    } else {
      selectedPlanets.add(planetName);
    }

    print('Selected planets: $selectedPlanets');
    update();
  }
}
