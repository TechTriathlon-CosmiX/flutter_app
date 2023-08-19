import 'package:CosmiX/screens/components_screen.dart';
import 'package:CosmiX/screens/home_screen.dart';
import 'package:CosmiX/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  late PageController pageController;

  RxInt currentPage = 0.obs;
  RxBool isDarkTheme = false.obs;

  List<Widget> pages = [
    const HomeScreen(),
    const SearchScreen(),
    const ComponentsScreen(),
  ];

  ThemeMode get theme => Get.isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void switchTheme(ThemeMode mode) {
    Get.changeThemeMode(mode);
  }

  void goToTab(int page) {
    // give haptic feedback
    HapticFeedback.mediumImpact();

    currentPage.value = page;
    pageController.jumpToPage(page);
  }

  void animateToTab(int page) {
    currentPage.value = page;
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
