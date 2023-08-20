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
      appBar: AppBar(title: const Text("Search Filter")),
      backgroundColor: CosmixColor.bgColor,
      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GlassCard(
                height: 460,
                borderRadius: 16,
                type: CardType.dark,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 26.0),
                  child: SearchFilter(),
                )),
            const SizedBox(height: 24.0),
            GlassButton(
                type: ButtonType.primary,
                fontSize: 17,
                buttonText: "Advanced filters",
                onPressed: () => Get.back()),
            const SizedBox(height: 24.0),
            GlassButton(
                type: ButtonType.primaryColor,
                leftIcon: const Icon(Icons.search_rounded),
                fontSize: 17,
                buttonText: "Search for flights",
                onPressed: () => Get.back()),
          ],
        )),
      ),
    );
  }


}
