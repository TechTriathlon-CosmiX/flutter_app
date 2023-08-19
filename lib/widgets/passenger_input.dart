import 'package:CosmiX/controllers/passenger_input_controller.dart';
import 'package:CosmiX/theme/colors.dart';
import 'package:CosmiX/theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PassengerInputRow extends StatelessWidget {
  final PassengerType type;
  RxInt count;
  final PassengerController controller;

  PassengerInputRow({
    required this.type,
    required this.count,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(type.label, style: const TextStyle(color: CosmixColor.white, fontFamily: CosmixFont.fontFamily, fontSize: 16),),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle_outline, color: CosmixColor.primaryColor, size: 32,),
                onPressed: () {
                  if (count > 0) {
                    count.value--;
                    controller.updateCounts(type, count.value);
                  }
                },
              ),
              SizedBox(
                width: 10,
              ),
              Obx(() => Text(count.toString(), style: const TextStyle(color: CosmixColor.white, fontFamily: CosmixFont.fontFamily, fontSize: 16),)),
              SizedBox(
              width: 10,
              ),
              IconButton(
                icon: const Icon(Icons.add_circle_outline, color: CosmixColor.primaryColor, size: 32,),
                onPressed: () {
                    count.value++;
                    controller.updateCounts(type, count.value);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
