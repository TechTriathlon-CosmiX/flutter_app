import 'package:CosmiX/screens/main_screen.dart';
import 'package:CosmiX/widgets/button.dart';
import 'package:CosmiX/widgets/card.dart';
import 'package:CosmiX/widgets/dropdown_field.dart';
import 'package:CosmiX/widgets/glass_button.dart';
import 'package:CosmiX/widgets/glass_card.dart';
import 'package:CosmiX/widgets/input_field.dart';
import 'package:CosmiX/widgets/step_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solar_icons/solar_icons.dart';

import '../controllers/register_controller.dart';
import '../theme/colors.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());

    return Scaffold(
      backgroundColor: CosmixColor.black,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //   colors: CosmixColor.darkGradient,
          // ),
          image: DecorationImage(
              image: AssetImage("assets/images/backgrounds/bg-3.webp"),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(child: _mainContent(context)),
      ),
    );
  }

  Widget _mainContent(BuildContext context) {
    final RegisterController controller = Get.find();
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => AnimatedContainer(
                  height: controller
                      .stepCardsHeight[controller.currentStep.value - 1],
                  duration: const Duration(milliseconds: 250),
                  child: SingleChildScrollView(
                    child: GlassCard(
                      blur: 4,
                      type: CardType.dark,
                      borderRadius: 16,
                      height: controller
                          .stepCardsHeight[controller.currentStep.value - 1],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 32, bottom: 24),
                              child: Column(
                                children: [
                                  const Text(
                                    "Sign up",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      letterSpacing: -0.5,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  const Text(
                                    "Create your CosmiX account",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      letterSpacing: -0.5,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  StepIndicator(
                                      numberOfSteps:
                                          controller.totalSteps.value,
                                      currentStep: controller.currentStep.value)
                                ],
                              ),
                            ),
                            _renderFormStep(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              Obx(() => Row(
                    children: [
                      if (controller.currentStep.value != 1)
                        GlassButton(
                          width: MediaQuery.of(context).size.width / 2 - 26,
                          onPressed: () {
                            if (controller.currentStep.value == 1) {
                              Get.back();
                              return;
                            }
                            controller.currentStep.value--;
                            // Get.to(() => MainScreen());
                          },
                          buttonText: "Previous",
                          type: ButtonType.secondary,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      if (controller.currentStep.value != 1)
                        const SizedBox(width: 20.0),
                      GlassButton(
                        width: controller.currentStep.value == 1
                            ? MediaQuery.of(context).size.width - 32
                            : MediaQuery.of(context).size.width / 2 - 26,
                        onPressed: () {
                          if (controller.currentStep == controller.totalSteps) {
                            Get.to(() => MainScreen());
                            return;
                          }
                          controller.currentStep.value++;
                        },
                        buttonText:
                            controller.currentStep == controller.totalSteps
                                ? "Finish"
                                : "Next",
                        type: ButtonType.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        rightIcon:
                            controller.currentStep == controller.totalSteps
                                ? const Icon(
                                    Icons.check_circle_outline_rounded,
                                    color: Colors.white,
                                    size: 18,
                                  )
                                : const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderFormStep() {
    final RegisterController controller = Get.find();
    switch (controller.currentStep.value) {
      case 1:
        return _formStep1(controller);
      case 2:
        return _formStep2(controller);
      case 3:
        return _formStep3(controller);
      default:
        return _formStep1(controller);
    }
  }

  Widget _formStep1(RegisterController controller) {
    return Column(
      children: [
        const SizedBox(height: 4.0),
        InputField(
            labelText: "Space Pass No.",
            fillColor: CosmixColor.lightestBlack,
            controller: controller.emailController,
            leadingIcon: const Icon(SolarIconsOutline.userId)),
        const SizedBox(height: 20.0),
        InputField(
            labelText: "Name",
            fillColor: CosmixColor.lightestBlack,
            height: 50,
            controller: controller.emailController,
            leadingIcon: const Icon(SolarIconsOutline.user)),
        const SizedBox(height: 20.0),
        InputField(
            labelText: "Date of Birth",
            fillColor: CosmixColor.lightestBlack,
            height: 50,
            controller: controller.emailController,
            leadingIcon: const Icon(SolarIconsOutline.calendar)),
        const SizedBox(height: 20.0),
        DropdownField(
            labelText: "Gender",
            fillColor: CosmixColor.lightestBlack,
            height: 54,
            items: controller.genderOptionsList,
            leadingIcon: const Icon(SolarIconsOutline.usersGroupTwoRounded)),
        const SizedBox(height: 20.0),
        DropdownField(
            labelText: "Home planet",
            fillColor: CosmixColor.lightestBlack,
            height: 54,
            items: controller.planetsOptionsList,
            leadingIcon: const Icon(SolarIconsOutline.planet2))
      ],
    );
  }

  Widget _formStep2(controller) {
    return Column(
      children: [
        const SizedBox(height: 4.0),
        InputField(
            labelText: "Email",
            fillColor: CosmixColor.lightestBlack,
            controller: controller.emailController,
            leadingIcon: const Icon(SolarIconsOutline.letter)),
        const SizedBox(height: 24.0),
        InputField(
            labelText: "Phone",
            fillColor: CosmixColor.lightestBlack,
            height: 50,
            controller: controller.emailController,
            leadingIcon: const Icon(SolarIconsOutline.phone)),
      ],
    );
  }

  Widget _formStep3(controller) {
    return Column(
      children: [
        const Text(
          "Create a strong password with at least 8 characters, including numbers and symbols",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13,
            color: CosmixColor.lightGrey,
          ),
        ),
        const SizedBox(height: 24.0),
        InputField(
            labelText: "Password",
            fillColor: CosmixColor.lightestBlack,
            controller: controller.emailController,
            leadingIcon: const Icon(SolarIconsOutline.lockPassword)),
        const SizedBox(height: 24.0),
        InputField(
            labelText: "Confirm password",
            fillColor: CosmixColor.lightestBlack,
            height: 50,
            controller: controller.emailController,
            leadingIcon: const Icon(SolarIconsOutline.lockPassword)),
        const SizedBox(height: 32.0),
        const Text(
          "By clicking on Finish, you agree to CosmiX Terms of Service and Privacy Policy",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13,
            color: CosmixColor.lightGrey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
