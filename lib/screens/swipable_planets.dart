import 'package:CosmiX/controllers/selectable_planet_controller.dart';
import 'package:CosmiX/widgets/selectable_planet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwipablePlanets extends StatelessWidget {
  final SelectablePlanetsController controller = Get.find();
  SwipablePlanets({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> planets = [
      'Venus',
      'Earth',
      'Mars',
      'Jupiter',
      'Saturn',
      'Uranus',
      'Neptune'
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: List.generate(planets.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SelectablePlanetWidget(
                planetName: planets[index],
              ),
            );
          }),
        ),
      ),
    );
  }
}
