import 'package:flutter/material.dart';

class CosmixColor {
  static const Color logoColor = Color(0xFFBC7E28);
  static const Color primaryColor = Color(0xFFBC7E28);
  static const Color secondaryColor = Color(0xFFD6B07C);
  static const Color accentColor = Color(0xFFD6B07C);

  static const Color white = Colors.white;
  static const Color lightWhite = Color(0x77FFFFFF);
  static const Color lighterWhite = Color(0x44FFFFFF);
  static const Color black = Colors.black;
  static const Color lightBlack = Colors.black87;
  static const Color lighterBlack = Colors.black45;
  static const Color grey = Color(0xFFA8A8A8);
  static const Color lightGrey = Color(0xFFF1F2F6);
  static const Color darkGrey = Color(0xFF625f6a);
  static const Color darkBlue = Color(0xFF4465A8);

  static const Color titleTextColor = Colors.white;
  static const Color subTitleTextColor = Colors.white70;
  static Color bgColor = const Color(0xFF131318);
  static Color shadowGrey = const Color(0x333E404D);
  static Color shadowGreyDark = const Color(0x113E404D);
  static Color shadowColor = CosmixColor.primaryColor.withOpacity(0.4);

  static List<Color> lightGradient = [
    Colors.white.withOpacity(0.3),
    Colors.white.withOpacity(0.15)
  ];
  static List<Color> darkGradient = [
    Colors.black.withOpacity(0.6),
    Colors.black.withOpacity(0.3)
  ];
  static List<Color> primaryColorGradient = [
    CosmixColor.primaryColor.withOpacity(0.8),
    CosmixColor.primaryColor.withOpacity(0.4)
  ];
  static List<Color> borderGradient = [
    CosmixColor.white.withOpacity(0.1),
    CosmixColor.white.withOpacity(0.5),
    CosmixColor.white.withOpacity(0.1),
  ];
  static List<Color> transparentGradient = [
    CosmixColor.white.withOpacity(0),
    CosmixColor.white.withOpacity(0),
  ];
}
