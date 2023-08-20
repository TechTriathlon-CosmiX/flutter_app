import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final List<DropdownMenuItem> genderOptionsList = [
    const DropdownMenuItem(
      value: "Male",
      child: Text("Male"),
    ),
    const DropdownMenuItem(
      value: "Female",
      child: Text("Female"),
    ),
    const DropdownMenuItem(
      value: "Other",
      child: Text("Other"),
    )
  ];
  final List<DropdownMenuItem> planetsOptionsList = [
    const DropdownMenuItem(
      value: "Earth",
      child: Text("Earth"),
    ),
    const DropdownMenuItem(
      value: "Mars",
      child: Text("Mars"),
    ),
    const DropdownMenuItem(
      value: "Jupiter",
      child: Text("Jupiter"),
    ),
    const DropdownMenuItem(
      value: "Saturn",
      child: Text("Saturn"),
    ),
    const DropdownMenuItem(
      value: "Uranus",
      child: Text("Uranus"),
    ),
    const DropdownMenuItem(
      value: "Neptune",
      child: Text("Neptune"),
    ),
    const DropdownMenuItem(
      value: "Pluto",
      child: Text("Pluto"),
    ),
  ];

  RxInt currentStep = 1.obs;
  RxInt totalSteps = 3.obs;
  RxList<double> stepCardsHeight = [558.0, 345.0, 455.0].obs;

  getCurrentStepCardHeight() => stepCardsHeight[currentStep.value - 1];
}
