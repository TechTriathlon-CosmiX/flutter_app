import 'dart:ui';

import 'package:CosmiX/controllers/planet_controller.dart';
import 'package:CosmiX/theme/colors.dart';
import 'package:CosmiX/theme/fonts.dart';
import 'package:CosmiX/widgets/button.dart';
import 'package:CosmiX/widgets/input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum BottomSheetInitiatorType {fromButton, toButton, departureTime, arrivalTime}

class BottomSheetPanel extends StatelessWidget {
  final TextEditingController controller;
  final PlanetController _planetController = Get.find();
  final BottomSheetInitiatorType initiator;
  BottomSheetPanel({super.key, required this.controller, required this.initiator});

  @override
  Widget build(BuildContext context) {
    if(initiator == BottomSheetInitiatorType.fromButton || initiator == BottomSheetInitiatorType.toButton) {
      return Container(
          decoration: BoxDecoration(
            color: CosmixColor.bgColor.withOpacity(0.85),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // search box
                    Center(
                      child: Container(
                        color: CosmixColor.lighterWhite,
                        height: 5,
                        width: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InputField(
                      labelText: 'Search for..',
                      leadingIcon: const Icon(Icons.search_rounded),
                      controller: controller,
                    ),
                    const SizedBox(height: 16),
                    const Text('SPACEPORT NETWORK', style: TextStyle(color: CosmixColor.lighterWhite, fontFamily: CosmixFont.fontFamily, fontSize: 12)),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _planetController.planets.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(CosmixColor.bgColor.withOpacity(0.85)),),
                                onPressed: () {
                                  // Handle the item click here.
                                  _planetController.changePlanet(initiator, _planetController.planets[index]);
                                  Navigator.pop(context);
                                },
                                child: SpacePort(travelLocation: _planetController.planets[index]),
                              ),
                              Divider(color: CosmixColor.lightGrey.withOpacity(0.2), thickness: 2),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
      );
    }else if(initiator == BottomSheetInitiatorType.departureTime || initiator == BottomSheetInitiatorType.arrivalTime){
      DateTime dateTime = DateTime.now();
      return Container(
        decoration: BoxDecoration(
          color: CosmixColor.bgColor.withOpacity(0.85),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  color: CosmixColor.lighterWhite,
                  height: 5,
                  width: 40,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 180,
                child: CupertinoTheme(
                  data: CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle: TextStyle(color: CosmixColor.white),
                    ),
                  ),
                  child: CupertinoDatePicker(
                    initialDateTime: dateTime,
                    mode: CupertinoDatePickerMode.dateAndTime,
                    onDateTimeChanged: (dateTime) => {
                      if(initiator == BottomSheetInitiatorType.departureTime || initiator == BottomSheetInitiatorType.arrivalTime)
                      {
                          _planetController
                          .
                          changeDepartureTime
                          (
                          initiator,
                          dateTime)
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Button(type: ButtonType.primary, buttonText: 'Done',onPressed: (){
                Navigator.pop(context);
              },)
            ],
          ),
        ),
      );
    }else{
      return Container();
    }
  }
}

class SpacePort extends StatelessWidget {
  final TravelLocation travelLocation;
  const SpacePort({super.key,required this.travelLocation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image of the planet
          Image.asset(
            'assets/images/planets/${travelLocation.planetName.toLowerCase()}.png',
            width: 70,
            height: 70,
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(travelLocation.planetName, style: TextStyle(fontFamily: CosmixFont.fontFamily, color: CosmixColor.titleTextColor, fontSize: 16)),
              Text(travelLocation.portName, style: TextStyle(fontFamily: CosmixFont.fontFamily, color: CosmixColor.primaryColor)),
            ],
          ),
        ],
      ),
    );
  }
}

