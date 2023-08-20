import 'package:flutter/material.dart';

import '../theme/colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CosmixColor.bgColor,
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Center(
            child: Text(
              "Search Screen",
              style: TextStyle(color: CosmixColor.white, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
