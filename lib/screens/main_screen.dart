import 'package:CosmiX/controllers/main_screen_controller.dart';
import 'package:CosmiX/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final MainController _controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: _bottomNavBar(context),
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
          child: _mainBody()),
    );
  }

  Widget _mainBody() {
    return PageView(
      controller: _controller.pageController,
      physics: const BouncingScrollPhysics(),
      onPageChanged: _controller.animateToTab,
      children: [..._controller.pages],
    );
  }

  Widget _bottomNavBar(BuildContext context) {
    return ClipRRect(
      // set border radius
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24.0),
        topRight: Radius.circular(24.0),
      ),
      child: BottomAppBar(
        color: Colors.black.withOpacity(0.1),
        height: 80,
        elevation: 0,
        child: Stack(
          children: [
            // ClipRRect(
            //   clipBehavior: Clip.hardEdge,
            //   borderRadius: BorderRadius.circular(24.0),
            //   child: BackdropFilter(
            //     filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8 * 2),
            //     child: Container(
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(24.0),
            //       ),
            //     ),
            //   ),
            // ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              height: 120,
              child: GlassmorphicBorder(
                  strokeWidth: 2,
                  radius: 24,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [
                      CosmixColor.white.withOpacity(0.05),
                      CosmixColor.white.withOpacity(0.3),
                      CosmixColor.white.withOpacity(0.5),
                      CosmixColor.white.withOpacity(0.3),
                      CosmixColor.white.withOpacity(0.05),
                    ],
                    stops: const [
                      0.0,
                      0.2,
                      0.5,
                      0.8,
                      1.0,
                    ],
                  )),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              color: Colors.transparent,
              padding: const EdgeInsets.only(left: 36, right: 36, top: 21),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _bottomNavBarItem(
                      icon: Icons.home_filled,
                      page: 0,
                      context,
                      label: "Home",
                    ),
                    _bottomNavBarItem(
                        icon: Icons.search_rounded,
                        page: 1,
                        context,
                        label: "Search"),
                    _bottomNavBarItem(
                        icon: Icons.rocket_launch,
                        page: 2,
                        context,
                        label: "My Trips"),
                    _bottomNavBarItem(
                      icon: Icons.settings,
                      page: 3,
                      context,
                      label: "Settings",
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _bottomNavBarItem(BuildContext context,
      {required icon, required page, required label}) {
    return GestureDetector(
      onTap: () => _controller.goToTab(page),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              icon,
              color: _controller.currentPage == page
                  ? CosmixColor.primaryColor
                  : CosmixColor.grey,
              size: 26,
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                  color: _controller.currentPage == page
                      ? CosmixColor.primaryColor
                      : CosmixColor.grey,
                  fontSize: 13,
                  fontWeight:
                      _controller.currentPage == page ? FontWeight.w600 : null),
            ),
          ],
        ),
      ),
    );
  }
}
