import 'package:CosmiX/theme/colors.dart';
import 'package:flutter/material.dart';

enum CardType { light, dark }

class CustomCard extends StatelessWidget {
  final Widget child; // New property to pass a child widget
  final CardType type;

  CustomCard(
      {super.key,
      required this.child,
      required this.type // Initialize the child widget
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: CosmixColor.shadowGreyDark,
            blurRadius: 32,
            offset: Offset(0, 16),
            spreadRadius: 0,
          )
        ],
        gradient: LinearGradient(
          colors: type == CardType.light
              ? [Colors.white.withOpacity(0.3), Colors.white.withOpacity(0.15)]
              : [Colors.black.withOpacity(0.6), Colors.black.withOpacity(0.3)],
          // Define your gradient colors
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        child: child,
      ),
    );
  }
}
