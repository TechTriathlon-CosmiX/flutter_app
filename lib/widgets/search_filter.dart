import 'package:CosmiX/controllers/booking_filter_controller.dart';
import 'package:CosmiX/screens/search_and_filter_screen.dart';
import 'package:CosmiX/theme/colors.dart';
import 'package:CosmiX/theme/fonts.dart';
import 'package:CosmiX/widgets/bottom_sheet_panel.dart';
import 'package:CosmiX/widgets/button.dart';
import 'package:CosmiX/widgets/card.dart';
import 'package:CosmiX/widgets/from_to_card.dart';
import 'package:CosmiX/widgets/glass_button.dart';
import 'package:CosmiX/widgets/passenger_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFilter extends StatelessWidget {
  SearchFilter({super.key});
  // final PassengerController passengerController = Get.find();
  final BookingFilterController _bookingFilterController = Get.find();
  @override
  Widget build(BuildContext context) {

    return Obx(() {
      Rx<TravelLocation> travelLocationfrom = _bookingFilterController
          .filterFromSpacePort;
      Rx<TravelLocation> travelLocationto = _bookingFilterController
          .filterToSpacePort;
      Rx<String>? departureDate = _bookingFilterController.departureDateAsText;
      Rx<String>? departureTime = _bookingFilterController.departureTimeAsText;
      Rx<String>? arrivalDate = _bookingFilterController.arrivalDateAsText;
      Rx<String>? arrivalTime = _bookingFilterController.arrivalTimeAsText;
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FromToCustomCard(type: CardType.light,
                fromtotype: FromToCardType.from,
                onTap: () {
                  _showCustomBottomSheet(context, BottomSheetType.locationList,
                      BottomSheetInitiatorType.fromButton);
                },
                location: travelLocationfrom.value.planetName,
                description: travelLocationfrom.value.portName,
          ),
          const SizedBox(height: 16),
          FromToCustomCard(type: CardType.light,
                fromtotype: FromToCardType.to,
                onTap: () {
                  _showCustomBottomSheet(context, BottomSheetType.locationList,
                      BottomSheetInitiatorType.toButton);
                },
                location: travelLocationto.value.planetName,
                description: travelLocationto.value.portName,),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    // button
                    GlassButton(
                        fontSize: 14,
                        leftIcon: const Icon(Icons.calendar_month_rounded),
                        type: ButtonType.secondary,
                        buttonText: "Departure",
                        onPressed: () {
                          _showCustomBottomSheet(
                              context, BottomSheetType.timeInput,
                              BottomSheetInitiatorType.departureTime);
                        }),
                    const SizedBox(height: 5,),
                    //show date time if selected
                    Center(
                      child: Column(
                        children: [
                          Text(
                            departureDate?.value ?? "",
                            style: const TextStyle(fontFamily: CosmixFont.fontFamily, color: CosmixColor.lightWhite),
                            ),
                          // }),
                          Text(
                            departureTime?.value ?? "",
                            style: const TextStyle(
                                fontFamily: CosmixFont.fontFamily,
                                color: CosmixColor.lightWhite),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  children: [
                    GlassButton(
                        fontSize: 14,
                        leftIcon: const Icon(Icons.calendar_month_rounded),
                        type: ButtonType.secondary,
                        buttonText: "Arrival",
                        onPressed: () {
                          _showCustomBottomSheet(
                              context, BottomSheetType.timeInput,
                              BottomSheetInitiatorType.arrivalTime);
                        }),
                    const SizedBox(height: 5,),
                    //show date time if selected
                    Center(
                      child: Column(
                        children: [
                          Text(
                            arrivalDate?.value ??
                                "",                            style: const TextStyle(
                                fontFamily: CosmixFont.fontFamily,
                                color: CosmixColor.lightWhite),
                          ),
                          Text(
                            arrivalTime?.value ??
                                "",
                            style: const TextStyle(
                                fontFamily: CosmixFont.fontFamily,
                                color: CosmixColor.lightWhite),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              PassengerInputRow(
                type: PassengerType.adult,
                count: _bookingFilterController.adultCount,
                controller: _bookingFilterController,
              ), PassengerInputRow(
                type: PassengerType.children,
                count: _bookingFilterController.childrenCount,
                controller: _bookingFilterController,
              ), PassengerInputRow(
                type: PassengerType.infant,
                count: _bookingFilterController.infantCount,
                controller: _bookingFilterController,
              ),
            ],
          )
        ],
      );
    });
  }

  void _showCustomBottomSheet(BuildContext context, BottomSheetType type, BottomSheetInitiatorType initiator) {
    final controller = TextEditingController(text: "");
    final isKeyboardVisible = ValueNotifier<bool>(false);

    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) =>
          ValueListenableBuilder<bool>(
            valueListenable: isKeyboardVisible,
            builder: (context, isKeyboardOpen, _) {
              final screenHeight = MediaQuery
                  .of(context)
                  .size
                  .height;
              var targetHeight = isKeyboardOpen
                  ? screenHeight * 0.85
                  : screenHeight * 0.75;
              if(initiator == BottomSheetInitiatorType.departureTime || initiator == BottomSheetInitiatorType.arrivalTime){
                targetHeight = isKeyboardOpen
                  ? screenHeight * 0.6
                    : screenHeight * 0.4;
              }

              return GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Close the bottom sheet when tapped outside.
                },
                child: SizedBox(
                  height: targetHeight,
                  child: BottomSheetPanel(
                      controller: controller, initiator: initiator),
                ),
              );
            },
          ),
    );
  }
}
