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
      backgroundColor: CosmixColor.bgColor,
      bottomNavigationBar: ClipRRect(
        // set border radius
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        child: BottomAppBar(
          color: Colors.black.withOpacity(0.8),
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
                padding: const EdgeInsets.only(left: 42, right: 42, top: 21),
                child: Obx(
                      () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _bottomAppBarItem(
                        icon: Icons.home_filled,
                        page: 0,
                        context,
                        label: "Home",
                      ),
                      _bottomAppBarItem(
                          icon: Icons.search_rounded,
                          page: 1,
                          context,
                          label: "Search"),
                          _bottomAppBarItem(
                              icon: Icons.dashboard_rounded,
                          page: 2,
                          context,
                          label: "Widgets"),
                        ],
                      ),
                ),
              )
            ],
          ),
        ),
      ),
      body: PageView(
        controller: _controller.pageController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: _controller.animateToTab,
        children: [..._controller.pages],
      ),
    );
  }

  Widget _bottomAppBarItem(BuildContext context,
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
                  fontSize: 15,
                  fontWeight:
                      _controller.currentPage == page ? FontWeight.w600 : null),
            ),
          ],
        ),
      ),
    );
  }
}
