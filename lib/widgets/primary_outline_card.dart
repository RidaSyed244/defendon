import 'package:flutter/material.dart';

class PrimaryOutlinedCard extends StatelessWidget {
  final Color? backgroundColor;
  final double? borderWidth;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsets? padding;
  final double? width;
  final double? height;
  final Widget? child;
  final EdgeInsets? margin;
  final VoidCallback? onTap;

  const PrimaryOutlinedCard({
    super.key,
    this.backgroundColor,
    this.borderWidth,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.width,
    this.height,
    required this.child,
    this.margin,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: width,
      height: height,
      child: Card(
        margin: margin ?? EdgeInsets.zero,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
          side: BorderSide(
            width: borderWidth ?? 0.3,
            color: borderColor ?? theme.colorScheme.outline,
          ),
        ),
        color: backgroundColor ?? theme.colorScheme.surface,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
          onTap: onTap,
          child: Padding(
            padding: padding ?? const EdgeInsets.all(12),
            child: child,
          ),
        ),
      ),
    );
  }
}
