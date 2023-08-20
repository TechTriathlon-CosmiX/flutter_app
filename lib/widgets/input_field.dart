import 'package:CosmiX/theme/colors.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final Icon? leadingIcon;
  final Color color;
  final double height;
  final Color fillColor;
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;

  const InputField({
    super.key,
    required this.labelText,
    required this.controller,
    this.leadingIcon,
    this.color = CosmixColor.white,
    this.height = 54,
    this.fillColor = CosmixColor.lighterBlack,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: CosmixColor.lighterWhite,
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(
          color: color, // Change the text color here
          fontSize: 15.0,
        ),
        decoration: InputDecoration(
          fillColor: fillColor,
          prefixIcon: leadingIcon != null
              ? Icon(
            leadingIcon?.icon,
                  color: color,
                  size: 22,
                )
              : null,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          floatingLabelStyle: const TextStyle(
              color: CosmixColor.lighterWhite,
              fontWeight: FontWeight.bold,
              fontSize: 15),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: CosmixColor.lightWhite)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: CosmixColor.secondaryColor)),
          filled: true,
          label: Text(labelText, style: TextStyle(color: color)),
          hintStyle: const TextStyle(color: CosmixColor.lightWhite),
        ),
      ),
    );
  }
}
