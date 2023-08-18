import 'package:CosmiX/controllers/home_controller.dart';
import 'package:CosmiX/screens/other_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final HomeController c = Get.put(HomeController());

    return Scaffold(
        // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),

        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: Center(
            child: ElevatedButton(
                child: const Text("Go to Other"),
                onPressed: () => Get.to(() => OtherScreen()))),
        floatingActionButton: FloatingActionButton(
            onPressed: c.increment, child: const Icon(Icons.add)));
  }
}
