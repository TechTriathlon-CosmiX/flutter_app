import 'package:CosmiX/theme/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/card.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(title: const Text("Cards")),
      backgroundColor: CosmixColor.bgColor,
      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCard(
                type: CardType.light,
                child: const Center(
                    child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Text(
                    "Light card",
                    style: TextStyle(color: CosmixColor.white),
                  ),
                ))),
            const SizedBox(height: 24),
            CustomCard(
                type: CardType.dark,
                child: const Center(
                    child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Text(
                    "Dark card",
                    style: TextStyle(color: CosmixColor.white),
                  ),
                ))),
          ],
        )),
      ),
    );
  }
}
