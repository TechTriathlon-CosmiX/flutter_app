import 'package:CosmiX/theme/colors.dart';
import 'package:CosmiX/widgets/glass_card.dart';
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
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCard(
                type: CardType.light,
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Text(
                    "Light card",
                    style: TextStyle(color: CosmixColor.white, fontSize: 16),
                  ),
                ))),
            SizedBox(height: 24),
            CustomCard(
                type: CardType.dark,
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Text(
                    "Light card",
                    style: TextStyle(color: CosmixColor.white, fontSize: 16),
                  ),
                ))),
            SizedBox(height: 24),
            GlassCard(
              child: Text(
                "Light Glass Card",
                style: TextStyle(color: CosmixColor.white, fontSize: 16),
              ),
              type: CardType.light,
            ),
            SizedBox(height: 24),
            GlassCard(
              child: Text(
                "Dark Glass Card",
                style: TextStyle(color: CosmixColor.white, fontSize: 16),
              ),
              type: CardType.dark,
            ),
          ],
        )),
      ),
    );
  }
}
