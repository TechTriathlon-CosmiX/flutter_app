import 'package:CosmiX/screens/buttons_screen.dart';
import 'package:CosmiX/screens/from_to_card_screen.dart';
import 'package:CosmiX/screens/inputs_screen.dart';
import 'package:CosmiX/screens/my_trips_screen.dart';
import 'package:CosmiX/screens/payment_screen.dart';
import 'package:CosmiX/screens/search_and_filter_screen.dart';
import 'package:CosmiX/screens/selectable_planet_screent.dart';
import 'package:CosmiX/screens/space_lines.dart';
import 'package:CosmiX/services/auth_service.dart';
import 'package:CosmiX/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/button.dart';
import '../widgets/glass_button.dart';
import 'cards_screen.dart';

class ComponentsScreen extends StatelessWidget {
  const ComponentsScreen({super.key});

  @override
  Widget build(context) {
    final authService = Get.find<AuthService>();
    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(
        title: Text("CosmiX App Components"),
        leading: SizedBox(),
      ),
      backgroundColor: CosmixColor.lightestBlack,
      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Padding(
        padding: const EdgeInsets.only(
            left: 24.0, right: 24.0, bottom: 0.0, top: 16.0),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlassButton(
                  rightIcon: const Icon(Icons.arrow_forward_ios),
                  type: ButtonType.primary,
                  buttonText: "Buttons",
                  onPressed: () => Get.to(() => const ButtonsScreen())),
              const SizedBox(height: 24),
              GlassButton(
                  rightIcon: const Icon(Icons.arrow_forward_ios),
                  type: ButtonType.primary,
                  buttonText: "Cards",
                  onPressed: () => Get.to(() => const CardsScreen())),
              const SizedBox(height: 24),
              GlassButton(
                  rightIcon: const Icon(Icons.arrow_forward_ios),
                  type: ButtonType.primary,
                  buttonText: "Inputs",
                  onPressed: () => Get.to(() => InputsScreen())),
              const SizedBox(height: 24),
              GlassButton(
                  rightIcon: const Icon(Icons.arrow_forward_ios),
                  type: ButtonType.primary,
                  buttonText: "Planets",
                  onPressed: () => Get.to(() => SelectablePlanetsScreen())),
              const SizedBox(height: 24),
              GlassButton(
                  rightIcon: const Icon(Icons.arrow_forward_ios),
                  type: ButtonType.primary,
                  buttonText: "From To Card",
                  onPressed: () => Get.to(() => const FromToCardScreen())),
              const SizedBox(height: 24),
              GlassButton(
                  rightIcon: const Icon(Icons.arrow_forward_ios),
                  type: ButtonType.primary,
                  buttonText: "Search Filter Page",
                  onPressed: () => Get.to(() => SearchAndFilterScreen())),
              const SizedBox(height: 24),
              GlassButton(
                  rightIcon: const Icon(Icons.arrow_forward_ios),
                  type: ButtonType.primary,
                  buttonText: "My Trips",
                  onPressed: () => Get.to(() => MyTrips())),
              const SizedBox(height: 24),
              GlassButton(
                  rightIcon: const Icon(Icons.arrow_forward_ios),
                  type: ButtonType.primary,
                  buttonText: "Space Lines",
                  onPressed: () => Get.to(() => SpaceLines())),
              const SizedBox(height: 24),
              GlassButton(
                  rightIcon: const Icon(Icons.arrow_forward_ios),
                  type: ButtonType.primary,
                  buttonText: "Payment Screen",
                  onPressed: () => Get.to(() => PaymentScreen())),
              const SizedBox(height: 24),
              GlassButton(
                  rightIcon: const Icon(Icons.arrow_forward_ios),
                  type: ButtonType.primaryColor,
                  buttonText: "Logout",
                  onPressed: () => {authService.forceLogout}),
            ],
          )),
        ),
      ),
    );
  }
}
