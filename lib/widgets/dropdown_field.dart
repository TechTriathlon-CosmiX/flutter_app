import 'package:CosmiX/theme/colors.dart';
import 'package:flutter/material.dart';

class DropdownField extends StatelessWidget {
  final Icon? leadingIcon;
  final Color color;
  final String labelText;
  final bool obscureText;
  final List<DropdownMenuItem> items;

  const DropdownField(
      {super.key,
      this.leadingIcon,
      this.color = CosmixColor.white,
      required this.labelText,
      this.obscureText = false,
      required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: CosmixColor.lighterWhite,
      ),
      child: DropdownButtonFormField(
        borderRadius: BorderRadius.circular(12),
        focusColor: Colors.black,
          style: TextStyle(
            color: color, // Change the text color here
            fontSize: 17.0,
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
            hintStyle: const TextStyle(color: CosmixColor.white),
          ),
          elevation: 0,
          items: items,
          dropdownColor: CosmixColor.lightBlack,
          onChanged: (value) {}),
    );
  }
}
