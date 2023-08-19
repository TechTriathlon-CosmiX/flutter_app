import 'package:CosmiX/theme/colors.dart';
import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, primaryColor, disabled }

class Button extends StatelessWidget {
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

  const Button({
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
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
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
                    ? [
                        CosmixColor.white.withOpacity(0.3),
                        CosmixColor.white.withOpacity(0.1),
                      ]
                    : type == ButtonType.primaryColor
                        ? [
                            CosmixColor.primaryColor.withOpacity(0.8),
                            CosmixColor.primaryColor.withOpacity(0.4),
                          ]
                        : type == ButtonType.secondary
                            ? [
                                CosmixColor.black.withOpacity(0.4),
                                CosmixColor.black.withOpacity(0.2),
                              ]
                            : [
                                Colors.transparent,
                                Colors.transparent,
                              ],
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: borderColor,
                    ),
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
                leftIcon != null
                    ? SizedBox(
                        width: 24,
                        height: 24,
                        child: Icon(
                          leftIcon?.icon,
                          color: color,
                          size: 24,
                        ),
                      )
                    : const SizedBox(
                        width: 0,
                      ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      color: type == ButtonType.disabled
                          ? CosmixColor.lighterWhite
                          : color,
                      fontSize: 20,
                      fontFamily: 'Gilroy-SemiBold',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                rightIcon != null
                    ? SizedBox(
                        width: 24,
                        height: 24,
                        child: Icon(
                          rightIcon?.icon,
                          color: color,
                          size: 24,
                        ),
                      )
                    : const SizedBox(
                        width: 0,
                      ),
              ],
            ),
          ),
        ));
  }
}
