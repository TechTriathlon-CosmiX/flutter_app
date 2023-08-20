<<<<<<< HEAD
import 'package:CosmiX/screens/buttons_screen.dart';
import 'package:CosmiX/screens/from_to_card_screen.dart';
import 'package:CosmiX/screens/my_trips_screen.dart';
import 'package:CosmiX/screens/passenger_input_screen.dart';
import 'package:CosmiX/screens/selectable_planet_screent.dart';
import 'package:CosmiX/screens/inputs_screen.dart';
import 'package:CosmiX/screens/space_lines.dart';
=======
>>>>>>> df77a3837047610528838aa0bbdf7dcfad1a9f98
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
