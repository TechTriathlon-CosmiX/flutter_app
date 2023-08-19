import 'package:CosmiX/widgets/button.dart';
import 'package:CosmiX/widgets/glass_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //   colors: CosmixColor.darkGradient,
          // ),
          image: DecorationImage(
              image: AssetImage("assets/images/backgrounds/bg-1.webp"),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 70),
                  child: Image(
                      width: 240,
                      image: AssetImage("assets/images/other/cosmix-logo.png"),
                      fit: BoxFit.cover),
                ),
                Column(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your Inter-planetary",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            "Travel Partner",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    GlassButton(
                      onPressed: () {
                        if (kDebugMode) {
                          print("Get Started clicked");
                        }
                      },
                      buttonText: "Get Started",
                      type: ButtonType.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      rightIcon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    GlassButton(
                      onPressed: () {
                        if (kDebugMode) {
                          print("Explore clicked");
                        }
                      },
                      buttonText: "Explore",
                      type: ButtonType.secondary,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
