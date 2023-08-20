import 'package:CosmiX/theme/colors.dart';
import 'package:CosmiX/screens/booking_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/button.dart';
import 'buttons_screen.dart';
import 'cards_screen.dart';
import 'inputs_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CosmixColor.bgColor,
      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(
                rightIcon: const Icon(Icons.arrow_forward_ios),
                type: ButtonType.primary,
                buttonText: "Buttons",
                onPressed: () => Get.to(() => const ButtonsScreen())),
            const SizedBox(height: 24),
            Button(
                rightIcon: const Icon(Icons.arrow_forward_ios),
                type: ButtonType.primary,
                buttonText: "Cards",
                onPressed: () => Get.to(() => const CardsScreen())),
            const SizedBox(height: 24),
            Button(
                rightIcon: const Icon(Icons.arrow_forward_ios),
                type: ButtonType.primary,
                buttonText: "Inputs",
                onPressed: () => Get.to(() => InputsScreen())),
            const SizedBox(height: 24),
            Button(
                rightIcon: const Icon(Icons.arrow_forward_ios),
                type: ButtonType.primary,
                buttonText: "Booking Screen",
                onPressed: () => Get.to(() => BookingScreen())),
          ],
        )),
      ),
    );
  }
}
