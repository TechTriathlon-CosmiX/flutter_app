import 'package:CosmiX/theme/colors.dart';
import 'package:CosmiX/widgets/desc_field.dart';
import 'package:CosmiX/widgets/dropdown_field.dart';
import 'package:CosmiX/widgets/input_field.dart';
import 'package:flutter/material.dart';

import '../widgets/card.dart';

class InputsScreen extends StatelessWidget {
  InputsScreen({super.key});

  final field1Controller = TextEditingController(text: "");
  final field2Controller = TextEditingController(text: "");

  @override
  Widget build(context) {
    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(title: const Text("Inputs")),
      backgroundColor: CosmixColor.bgColor,
      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputField(
              labelText: 'Placeholder',
              controller: field1Controller,
            ),
            const SizedBox(
              height: 32,
            ),
            InputField(
              labelText: 'Placeholder',
              leadingIcon: const Icon(Icons.person),
              controller: field2Controller,
            ),
            const SizedBox(
              height: 32,
            ),
            DescField(
              labelText: 'Placeholder',
              leadingIcon: const Icon(Icons.person),
              controller: field2Controller,
            ),
            const SizedBox(
              height: 32,
            ),
            const DropdownField(
              labelText: 'Placeholder',
              items: [
                DropdownMenuItem(
                  child: Text('Item 1'),
                  value: '1',
                ),
                DropdownMenuItem(
                  child: Text('Item 2'),
                  value: '2',
                ),
                DropdownMenuItem(
                  child: Text('Item 3'),
                  value: '3',
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
