import 'package:CosmiX/controllers/selectable_planet_controller.dart';
import 'package:CosmiX/theme/colors.dart';
import 'package:CosmiX/widgets/selectable_planet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectablePlanetsScreen extends StatelessWidget {
  final SelectablePlanetsController controller = Get.find();

  SelectablePlanetsScreen({super.key});

  @override
  Widget build(context) {
    List<String> planets = [
      'Venus',
      'Earth',
      'Mars',
      'Jupiter',
      'Saturn',
      'Uranus',
      'Neptune'
    ];
    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(title: const Text("Planets")),
      backgroundColor: CosmixColor.bgColor,
      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 15.0,
            crossAxisCount: 3, // Number of widgets in a row
          ),
          itemCount: controller.planets.length,
          itemBuilder: (context, index) {
            return SelectablePlanetWidget(
              planetName: controller.planets[index],
            );
          },
        ),
      ),
    );
  }
}
