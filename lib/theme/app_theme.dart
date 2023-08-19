import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppTheme {
  static final ThemeData mainTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: CosmixColor.secondaryColor,
        primary: CosmixColor.primaryColor,
      ),
      primaryColor: CosmixColor.primaryColor,
      primaryColorDark: CosmixColor.primaryColor,
      primaryColorLight: CosmixColor.secondaryColor,
      dividerColor: CosmixColor.lightGrey,
      textTheme: GoogleFonts.interTextTheme(
        ThemeData.light().textTheme,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: CosmixColor.primaryColor,
        selectionColor: CosmixColor.secondaryColor,
        selectionHandleColor: CosmixColor.secondaryColor,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
      ),
      brightness: Brightness.light,

      /// Other Colors
      splashColor: CosmixColor.primaryColor.withAlpha(50),
      indicatorColor: CosmixColor.lightGrey,
      highlightColor: CosmixColor.lightGrey,
      unselectedWidgetColor: CosmixColor.lightWhite);
}
