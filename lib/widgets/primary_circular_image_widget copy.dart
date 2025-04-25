import 'package:defendon/utils/app_colors.dart';
import 'package:defendon/utils/padding_extensions.dart';
import 'package:flutter/material.dart';


class PrimaryCircularImageWidget extends StatelessWidget {
  final Color? backgroundColor;
  final double padding;
  final double imageHeight;
  final String imagePath;
  final bool? enableBorder;
  final double? borderWidth;
  final Color? borderColor;
  final bool isCircle;
  final double? borderRadius;
  final Color? imageColor;
  const PrimaryCircularImageWidget({
    super.key,
    this.backgroundColor,
    this.padding = 16.0,
    this.imageHeight = 46,
    required this.imagePath,
    this.enableBorder,
    this.borderWidth,
    this.borderColor,
    this.isCircle = true,
    this.borderRadius,
    this.imageColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primary,
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: isCircle
              ? null
              : BorderRadius.circular(
                  borderRadius ?? 12,
                ),
          border: enableBorder == true
              ? Border.all(
                  width: borderWidth ?? 0,
                  color: borderColor ?? Colors.green,
                )
              : null),
      child: Image.asset(
        imagePath,
        height: imageHeight,
        color: imageColor,
      ).p12(),
    );
  }
}
