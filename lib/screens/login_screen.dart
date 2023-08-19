import 'package:CosmiX/widgets/button.dart';
import 'package:CosmiX/widgets/card.dart';
import 'package:CosmiX/widgets/glass_button.dart';
import 'package:CosmiX/widgets/glass_card.dart';
import 'package:CosmiX/widgets/input_field.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
          height: 40,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Don't have an account?",
                  style: TextStyle(
                      color: CosmixColor.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
              const SizedBox(
                height: 4.0,
              ),
              GestureDetector(
                child: const Text("Sign up",
                    style: TextStyle(
                        color: CosmixColor.primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600)),
                onTap: () {},
              )
            ],
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GlassCard(
                  blur: 4,
                  type: CardType.dark,
                  borderRadius: 16,
                  height: 336,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 40, bottom: 36),
                          child: Text(
                            "Sign in",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              letterSpacing: -0.5,
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        InputField(
                            labelText: "Email",
                            controller: emailController,
                            leadingIcon: const Icon(Icons.person_2_outlined)),
                        const SizedBox(height: 20.0),
                        InputField(
                            labelText: "Password",
                            controller: emailController,
                            leadingIcon:
                                const Icon(Icons.lock_outline_rounded)),
                        const SizedBox(height: 36.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Having trouble signing in?",
                                style: TextStyle(
                                    color: CosmixColor.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400)),
                            const SizedBox(
                              width: 4.0,
                            ),
                            GestureDetector(
                              child: const Text("Get help",
                                  style: TextStyle(
                                      color: CosmixColor.primaryColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600)),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                GlassButton(
                  onPressed: () {
                    print("clicked");
                  },
                  buttonText: "Login",
                  type: ButtonType.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  rightIcon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
