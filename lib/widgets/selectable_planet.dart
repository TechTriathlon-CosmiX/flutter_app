import 'dart:ui';

import 'package:CosmiX/controllers/selectable_planet_controller.dart';
import 'package:CosmiX/theme/colors.dart';
import 'package:CosmiX/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SelectablePlanetWidget extends StatelessWidget {
  final String planetName;
  final SelectablePlanetsController controller = Get.find();

  SelectablePlanetWidget({
    Key? key,
    required this.planetName,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    // print(isSelected);
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: (){
              controller.togglePlanetSelection(planetName);
            },
            child: Obx(() {
                  final controller = Get.find<SelectablePlanetsController>();
                  final isSelected = controller.selectedPlanets.contains(planetName);

                  return Stack(
                fit: StackFit.loose,
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: isSelected ? Colors.white.withOpacity(0.15) : Colors.transparent,
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.3),
                          width: 1.0,
                        )
                    ),
                  ),
                  // blur effect
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 4.0,
                        sigmaY: 4.0,
                      ),
                      child: const SizedBox(
                        height: 90,
                        width: 90,
                      ),
                    ),
                  ),
                  // gradient effect
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.white.withOpacity(0.1),),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(0.15),
                            Colors.white.withOpacity(0.05),
                          ]
                      ),
                    ),

                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/planets/${planetName.replaceAll(' ', '').toLowerCase()}.png',
                        height: 70,
                        // width: 105,
                      ),
                    ),
                  ),
                  if (isSelected)
                    Container(
                      width: 78,
                      height: 78,
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: CosmixColor.primaryColor,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.transparent,
                            width: 0.0,
                          ),
                        ),
                        child: const Icon(
                          size: 20,
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              );
              }),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: Center(
                child: Text(
                    planetName,
                    style: const TextStyle(
                      fontSize: 17,
                      color: CosmixColor.titleTextColor,
                      fontFamily: CosmixFont.fontFamily,
                    )
                )
            ),
          )
        ],
      ),
    );
  }
}
