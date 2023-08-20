import 'package:CosmiX/theme/colors.dart';
import 'package:CosmiX/widgets/from_to_card.dart';
import 'package:flutter/material.dart';

import '../widgets/card.dart';

class FromToCardScreen extends StatelessWidget {
  const FromToCardScreen({super.key});

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
            FromToCustomCard(
              onTap: (){},
              fromtotype: FromToCardType.from,
              type: CardType.light,
              location: 'Earth',
              description: 'E Space launch #2 - CA, USA',
            ),
            const SizedBox(height: 24),

          ],
        )),
      ),
    );
  }
}
