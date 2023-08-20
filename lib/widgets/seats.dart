import 'package:flutter/material.dart';

class Seats extends StatelessWidget {
  final bool isSelected;
  final bool isReserved;

  const Seats({
    Key? key,
    required this.isSelected,
    required this.isReserved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color boxColor = isSelected ? Colors.white : isReserved ? const Color(0xFFBC7E28) : Colors.transparent;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: const Color(0xFF787878),
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
