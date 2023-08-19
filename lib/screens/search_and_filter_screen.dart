import 'package:CosmiX/controllers/passenger_input_controller.dart';
import 'package:CosmiX/theme/colors.dart';
import 'package:CosmiX/widgets/button.dart';
import 'package:CosmiX/widgets/card.dart';
import 'package:CosmiX/widgets/passenger_input.dart';
import 'package:CosmiX/widgets/search_filter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SearchAndFilterScreen extends StatelessWidget {
  SearchAndFilterScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(title: const Text("Search Filter")),
      backgroundColor: CosmixColor.bgColor,
      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all( // Add this border
                  color: CosmixColor.lighterWhite, // Border color
                  width: 1.0, // Border width
                ),
              ),
              child: CustomCard(type: CardType.dark, child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
                child: SearchFilter(),
              )),
            ),
            const SizedBox(height: 24.0),
            Button(
                type: ButtonType.primary,
                buttonText: "Advanced filters",
                onPressed: () => Get.back()),
            const SizedBox(height: 24.0),
            Button(rightIcon: const Icon(Icons.check_circle_outline_rounded),
                type: ButtonType.primaryColor,
                buttonText: "Primary",
                onPressed: () => Get.back()),
          ],
        )),
      ),
    );
  }
}
