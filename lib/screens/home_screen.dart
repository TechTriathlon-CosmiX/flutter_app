import 'package:CosmiX/theme/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CosmixColor.bgColor,
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Center(
            child: Text(
              "Home Screen",
              style: TextStyle(color: CosmixColor.white, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
