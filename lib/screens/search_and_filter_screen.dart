import 'package:CosmiX/screens/space_lines.dart';
import 'package:CosmiX/theme/colors.dart';
import 'package:CosmiX/widgets/button.dart';
import 'package:CosmiX/widgets/card.dart';
import 'package:CosmiX/widgets/glass_button.dart';
import 'package:CosmiX/widgets/glass_card.dart';
import 'package:CosmiX/widgets/search_filter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum BottomSheetType { locationList, timeInput }

class SearchAndFilterScreen extends StatelessWidget {
  SearchAndFilterScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(
        title: const Text("Search Flights"),
        leading: SizedBox(),
      ),
      backgroundColor: CosmixColor.lightestBlack,
      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
        child: SingleChildScrollView(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GlassCard(
                  height: 428,
                  borderRadius: 16,
                  type: CardType.dark,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 24.0),
                    child: SearchFilter(),
                  )),
              const SizedBox(height: 20.0),
              GlassButton(
                  type: ButtonType.primary,
                  fontSize: 17,
                  buttonText: "Advanced filters",
                  onPressed: () => Get.back()),
              const SizedBox(height: 20.0),
              GlassButton(
                  type: ButtonType.primaryColor,
                  leftIcon: const Icon(Icons.search_rounded),
                  fontSize: 17,
                  buttonText: "Search for flights",
                  onPressed: () => Get.to(() => SpaceLines())),
            ],
          )),
        ),
      ),
    );
  }
}
