import 'package:CosmiX/theme/colors.dart';
import 'package:CosmiX/widgets/glass_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/button.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(title: Text("Buttons")),
      backgroundColor: CosmixColor.bgColor,
      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(
                leftIcon: const Icon(Icons.add),
                type: ButtonType.primary,
                buttonText: "Primary",
                onPressed: () => Get.back()),
            const SizedBox(height: 24),
            Button(
              rightIcon: const Icon(Icons.check),
                type: ButtonType.secondary,
                buttonText: "Secondary",
                onPressed: () => Get.back()),
            const SizedBox(height: 24),
            Button(
                type: ButtonType.primaryColor,
                buttonText: "Primary Color",
                onPressed: () => Get.back()),
            const SizedBox(height: 24),
            Button(
                type: ButtonType.disabled,
                buttonText: "Disabled",
                onPressed: () => Get.back()),
            const SizedBox(height: 24),
            Divider(
              color: CosmixColor.white.withOpacity(0.3),
              thickness: 1,
            ),
            const SizedBox(height: 24),
            GlassButton(
                onPressed: () => Get.back(),
                buttonText: "Primary Glass",
                type: ButtonType.primary),
            const SizedBox(height: 24),
            GlassButton(
                onPressed: () => Get.back(),
                buttonText: "Secondary Glass",
                type: ButtonType.secondary),
            const SizedBox(height: 24),
            GlassButton(
                onPressed: () => Get.back(),
                buttonText: "Primary Color Glass",
                type: ButtonType.primaryColor),
            const SizedBox(height: 24),
            GlassButton(
                onPressed: () => Get.back(),
                buttonText: "Disabled Glass",
                type: ButtonType.disabled),
          ],
        )),
      ),
    );
  }
}
