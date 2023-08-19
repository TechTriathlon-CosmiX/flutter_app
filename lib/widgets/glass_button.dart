import 'package:CosmiX/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

import 'button.dart';

class GlassButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;
  final double height;
  final double width;
  final double fontSize;
  final double iconSize;
  final Color borderColor;
  final Color color;
  final ButtonType type;
  final Icon? leftIcon;
  final Icon? rightIcon;
  final bool showBorder;
  final double blur;
  final bool showShadow;
  final double borderRadius;

  const GlassButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.type,
    this.leftIcon,
    this.rightIcon,
    this.height = 55,
    this.width = double.infinity,
    this.fontSize = 16,
    this.iconSize = 21,
    this.borderColor = CosmixColor.lightWhite,
    this.color = CosmixColor.white,
    this.showBorder = true,
    this.blur = 14,
    this.showShadow = true,
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      borderRadius: borderRadius,
      blur: blur,
      alignment: Alignment.bottomCenter,
      border: 1.5,
      linearGradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: CosmixColor.lightGradient,
      ),
      borderGradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: CosmixColor.borderGradient,
      ),
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(0),
        ),
        child: Container(
          width: double.infinity,
          height: height,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              colors: type == ButtonType.primary
                  ? CosmixColor.lightGradient
                  : type == ButtonType.primaryColor
                      ? CosmixColor.primaryColorGradient
                      : type == ButtonType.secondary
                          ? CosmixColor.darkGradient
                          : CosmixColor.transparentGradient,
            ),
            shape: RoundedRectangleBorder(
              side: showBorder
                  ? BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: borderColor,
                    )
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(16),
            ),
            shadows: [
              BoxShadow(
                color: type == ButtonType.primaryColor
                    ? CosmixColor.primaryColor.withOpacity(0.3)
                    : CosmixColor.shadowGrey,
                blurRadius: 32,
                offset: const Offset(0, 16),
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (leftIcon != null)
                SizedBox(
                  width: iconSize + 3,
                  height: iconSize + 3,
                  child: Icon(
                    leftIcon?.icon,
                    color: color,
                    size: iconSize,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: type == ButtonType.disabled
                        ? CosmixColor.lighterWhite
                        : color,
                    fontSize: fontSize,
                    fontFamily: 'Gilroy-SemiBold',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              if (rightIcon != null)
                SizedBox(
                  width: iconSize + 3,
                  height: iconSize + 3,
                  child: Icon(
                    rightIcon?.icon,
                    color: color,
                    size: iconSize,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}