import 'package:CosmiX/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

import 'card.dart';

class GlassCard extends StatelessWidget {
  final Widget child; // New property to pass a child widget
  final CardType type;
  final double blur;
  final bool showShadow;
  final bool showBorder;
  final double borderRadius;
  final double width;
  final double height;

  const GlassCard({
    super.key,
    required this.child,
    required this.type, // Initialize the child widget
    this.blur = 14,
    this.showShadow = true,
    this.showBorder = true,
    this.borderRadius = 10,
    this.width = double.infinity,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      borderRadius: borderRadius,
      blur: blur,
      alignment: Alignment.center,
      border: 1.5,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: type == CardType.light
            ? CosmixColor.lightGradient
            : CosmixColor.darkGradient,
      ),
      borderGradient: showBorder
          ? LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: CosmixColor.borderGradient,
            )
          : LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: CosmixColor.transparentGradient,
            ),
      width: width,
      height: height,
      child: child,
    );
  }
}
