import 'package:CosmiX/theme/colors.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final Icon? leadingIcon;
  final Color color;
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;

  const InputField({
    super.key,
    this.leadingIcon,
    this.color = CosmixColor.white,
    required this.labelText,
    this.obscureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: CosmixColor.lighterWhite,
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(
          color: color, // Change the text color here
          fontSize: 16.0,
        ),
        decoration: InputDecoration(
          prefixIcon: leadingIcon != null
              ? Icon(
                  leadingIcon?.icon,
                  color: color,
                )
              : null,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          floatingLabelStyle: const TextStyle(
              color: CosmixColor.lighterWhite,
              fontWeight: FontWeight.bold,
              fontSize: 16),
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