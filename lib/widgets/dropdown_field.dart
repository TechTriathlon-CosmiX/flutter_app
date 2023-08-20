import 'package:CosmiX/theme/colors.dart';
import 'package:flutter/material.dart';

class DropdownField extends StatelessWidget {
  final Icon? leadingIcon;
  final Color color;
  final double height;
  final Color fillColor;
  final String labelText;
  final bool obscureText;
  final List<DropdownMenuItem> items;

  const DropdownField(
      {super.key,
      required this.labelText,
      this.leadingIcon,
      this.color = CosmixColor.white,
      this.height = 54,
      this.fillColor = CosmixColor.lighterBlack,
      this.obscureText = false,
      required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: CosmixColor.lighterWhite,
      ),
      child: DropdownButtonFormField(
          padding: const EdgeInsets.all(0),
          isDense: true,
          isExpanded: false,
          elevation: 0,
          iconEnabledColor: CosmixColor.white,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: color,
          ),
          iconSize: 22,
          borderRadius: BorderRadius.circular(12),
          focusColor: CosmixColor.lighterBlack,
          style: TextStyle(
            height: 1.1,
            color: color, // Change the text color here
            fontSize: 14.0,
          ),
          decoration: InputDecoration(
            fillColor: fillColor,
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
                fontSize: 15),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: CosmixColor.lightWhite)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                const BorderSide(color: CosmixColor.secondaryColor)),
            filled: true,
            label: Text(labelText, style: TextStyle(color: color)),
            hintStyle: const TextStyle(color: CosmixColor.white),
          ),
          items: items,
          dropdownColor: CosmixColor.lightBlack,
          onChanged: (value) {}),
    );
  }
}
