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

class BottomSheetPanel extends StatefulWidget {
  final TextEditingController controller;
  final BottomSheetInitiatorType initiator;
  BottomSheetPanel({super.key, required this.controller, required this.initiator});

  @override
  State<BottomSheetPanel> createState() => _BottomSheetPanelState();
}

class _BottomSheetPanelState extends State<BottomSheetPanel> {
  final PlanetController _planetController = Get.find();
  List<TravelLocation> _travelLocations = [];
  // filter method
  List<TravelLocation> filterSpaceports(String input) {
    final lowerCaseInput = input.toLowerCase();
    return _planetController.planets.where((spaceport) {
      final lowerCasePlanetName = spaceport.planetName.toLowerCase();
      final lowerCasePortName = spaceport.portName.toLowerCase();
      // uncomment if you want to filter the spaceport as well
      // return lowerCasePlanetName.contains(lowerCaseInput) ||
      //     lowerCasePortName.contains(lowerCaseInput);
      return lowerCasePlanetName.contains(lowerCaseInput);
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    _travelLocations = _planetController.planets;
  }

  @override
  Widget build(BuildContext context) {
    if(widget.initiator == BottomSheetInitiatorType.fromButton || widget.initiator == BottomSheetInitiatorType.toButton) {
      return Container(
          decoration: BoxDecoration(
            color: CosmixColor.black.withOpacity(0.75),
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
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 16.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // search box
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: CosmixColor.lighterWhite,
                        ),
                        height: 4,
                        width: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputField(
                      labelText: 'Search Spaceports ...',
                      leadingIcon: const Icon(Icons.search_rounded),
                      controller: widget.controller,
                      onChanged: (input){
                        setState(() {
                          _travelLocations = filterSpaceports(input);
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    const Text('SPACEPORT NETWORK', style: TextStyle(color: CosmixColor.lighterWhite, fontFamily: CosmixFont.fontFamily, fontSize: 12)),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _planetController.planets.length,
                        itemBuilder: (context, index) {
                          return Visibility(
                            visible: _travelLocations.contains(_planetController.planets[index]),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<
                                              Color>(
                                          CosmixColor.black.withOpacity(0.75)),
                                    ),
                                    onPressed: () {
                                      // Handle the item click here.
                                      _planetController.changePlanet(widget.initiator,
                                          _planetController.planets[index]);
                                      Navigator.pop(context);
                                    },
                                    child: SpacePort(
                                        travelLocation:
                                            _planetController.planets[index]),
                                  ),
                                ),
                                Divider(
                                    color: CosmixColor.lightGrey.withOpacity(0.2),
                                    thickness: 1.5),
                              ],
                            ),
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
    }else if(widget.initiator == BottomSheetInitiatorType.departureTime || widget.initiator == BottomSheetInitiatorType.arrivalTime){
      DateTime dateTime = DateTime.now();
      return Container(
        decoration: BoxDecoration(
          color: CosmixColor.black.withOpacity(0.5),
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
                      if(widget.initiator == BottomSheetInitiatorType.departureTime || widget.initiator == BottomSheetInitiatorType.arrivalTime)
                      {
                          _planetController
                          .
                          changeDepartureTime
                          (
                          widget.initiator,
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
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // image of the planet
          Image.asset(
            'assets/images/planets/${travelLocation.planetName.toLowerCase()}.png',
            width: 64,
            height: 64,
          ),
          const SizedBox(width: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(travelLocation.planetName,
                  style: const TextStyle(
                      fontFamily: CosmixFont.fontFamily,
                      color: CosmixColor.titleTextColor,
                      fontSize: 16)),
              Text(travelLocation.portName,
                  style: const TextStyle(
                      fontFamily: CosmixFont.fontFamily,
                      color: CosmixColor.primaryColor)),
              const SizedBox(height: 8),
            ],
          ),
        ],
      ),
    );
  }
}

