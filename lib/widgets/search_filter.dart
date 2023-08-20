import 'package:CosmiX/controllers/passenger_input_controller.dart';
import 'package:CosmiX/widgets/button.dart';
import 'package:CosmiX/widgets/card.dart';
import 'package:CosmiX/widgets/from_to_card.dart';
import 'package:CosmiX/widgets/passenger_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFilter extends StatelessWidget {
  SearchFilter({super.key});
  final PassengerController passengerController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FromToCustomCard(type: CardType.light, fromtotype: FromToCardType.from, onTap: (){}, location: 'Earth', description: 'E Space launch #2 - CA, USA'),
        SizedBox(height: 16),
        FromToCustomCard(type: CardType.light, fromtotype: FromToCardType.to, onTap: (){}, location: 'Saturn', description: 'S Space launch #1 - Titan'),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Button(
                  fontSize: 14,
                  leftIcon: const Icon(Icons.calendar_month_rounded),
                  type: ButtonType.primary,
                  buttonText: "Departure",
                  onPressed: () => {}),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Button(
                  fontSize: 14,
                  leftIcon: const Icon(Icons.calendar_month_rounded),
                  type: ButtonType.primary,
                  buttonText: "Arrival",
                  onPressed: () => {}),
            ),
          ],
        ),
        SizedBox(height: 16),
        Container(
          child: Column(
            children: [
              PassengerInputRow(
                type: PassengerType.adult,
                count: passengerController.adultCount,
                controller: passengerController,
              ),PassengerInputRow(
                type: PassengerType.children,
                count: passengerController.childrenCount,
                controller: passengerController,
              ),PassengerInputRow(
                type: PassengerType.infant,
                count: passengerController.infantCount,
                controller: passengerController,
              ),
            ],
          )
        )
      ],
    );
  }
}
