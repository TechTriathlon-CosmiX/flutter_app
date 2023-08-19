import 'package:CosmiX/screens/buttons_screen.dart';
import 'package:CosmiX/screens/inputs_screen.dart';
import 'package:CosmiX/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../widgets/button.dart';
import 'cards_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(title: Text("CosmiX App Components")),
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
            GlassmorphicContainer(
              borderRadius: 16,
              blur: 14,
              alignment: Alignment.bottomCenter,
              border: 1.5,
              linearGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  CosmixColor.white.withOpacity(0.3),
                  CosmixColor.white.withOpacity(0.1),
                ],
              ),
              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF0FFFF).withOpacity(0.1),
                  Color(0xFFFFFFF).withOpacity(0.6),
                  Color(0xFF0FFFF).withOpacity(0.1),
                ],
              ),
              width: double.infinity,
              height: 60,
              child: Container(
                child: ElevatedButton(
                  onPressed: () => Get.to(() => InputsScreen()),
                  child: Center(child: const Text("Button")),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    elevation: 0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            GlassmorphicContainer(
              borderRadius: 16,
              blur: 14,
              alignment: Alignment.bottomCenter,
              border: 1.5,
              linearGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  CosmixColor.white.withOpacity(0.1),
                  CosmixColor.white.withOpacity(0.1),
                ],
              ),
              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF0FFFF).withOpacity(0.1),
                  Color(0xFFFFFFF).withOpacity(0.6),
                  Color(0xFF0FFFF).withOpacity(0.1),
                ],
              ),
              width: double.infinity,
              height: 60,
              child: TextField(
                style: TextStyle(
                  color: Colors.white, // Change the text color here
                  fontSize: 16.0,
                ),
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  floatingLabelStyle: const TextStyle(
                      color: CosmixColor.lighterWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                  filled: false,
                  label: Text("Test", style: TextStyle(color: Colors.white)),
                  hintStyle: const TextStyle(color: CosmixColor.lightWhite),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
