import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static final ThemeData mainTheme = ThemeData(
    // set global font
    fontFamily: 'Gilroy',
    colorScheme: ColorScheme.fromSeed(
      seedColor: CosmixColor.secondaryColor,
      primary: CosmixColor.primaryColor,
    ),
    primaryColor: CosmixColor.primaryColor,
    primaryColorDark: CosmixColor.primaryColor,
    primaryColorLight: CosmixColor.secondaryColor,
    dividerColor: CosmixColor.lightGrey,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: CosmixColor.primaryColor,
      selectionColor: CosmixColor.secondaryColor,
      selectionHandleColor: CosmixColor.secondaryColor,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
    ),
    // brightness: Brightness.dark,
    // Other Colors
    splashColor: CosmixColor.primaryColor.withAlpha(50),
    indicatorColor: CosmixColor.lightGrey,
    highlightColor: CosmixColor.lightGrey,
  );
}
