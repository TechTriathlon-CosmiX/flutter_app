import 'package:CosmiX/controllers/main_screen_controller.dart';
import 'package:CosmiX/controllers/booking_filter_controller.dart';
import 'package:CosmiX/controllers/selectable_planet_controller.dart';
import 'package:CosmiX/screens/welcome_screen.dart';
import 'package:CosmiX/services/api_service.dart';
import 'package:CosmiX/services/auth_service.dart';
import 'package:CosmiX/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(MainController());
    Get.put(AuthService());
    Get.put(ApiService());

    // Force portrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    // Change status bar icon color to white
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CosmiX',
      theme: AppTheme.mainTheme,
      home: const WelcomeScreen(),
      initialBinding: BindingsBuilder(() {
        Get.put(SelectablePlanetsController());
        Get.put(BookingFilterController());
      }),
    );
  }
}
