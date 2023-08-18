import 'package:CosmiX/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtherScreen extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final HomeController c = Get.find();

  OtherScreen({super.key});

  @override
  Widget build(context){
    // Access the updated count variable
    return Scaffold(body: Center(child: Text("${c.count}")));
  }
}