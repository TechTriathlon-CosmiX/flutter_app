import 'package:CosmiX/theme/colors.dart';
import 'package:flutter/material.dart';

enum CardType { light, dark }

class CustomCard extends StatelessWidget {
  final Widget child; // New property to pass a child widget
  final CardType type;
  final bool showShadow;
  final bool showBorder;

  const CustomCard({
    super.key,
    required this.child,
    required this.type, // Initialize the child widget
    this.showShadow = true,
    this.showBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          showShadow
              ? BoxShadow(
                  color: CosmixColor.shadowGreyDark,
                  blurRadius: 32,
                  offset: const Offset(0, 16),
                  spreadRadius: 0,
                )
              : const BoxShadow(
                  color: Colors.transparent,
                  blurRadius: 0,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                ),
        ],
        gradient: LinearGradient(
          colors: type == CardType.light
              ? CosmixColor.lightGradient
              : CosmixColor.darkGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: showBorder
            ? Border.all(
                color: CosmixColor.lightWhite,
                width: 1,
              )
            : null,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        child: child,
      ),
    );
  }
}
