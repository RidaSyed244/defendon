import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:defendon/utils/app_colors.dart';
import 'package:defendon/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageBuilder extends StatelessWidget {
  final String? url;
  final XFile? file;
  final String nameLetter;
  final Function(XFile file)? onChanged;
  final Size? size;
  final Color? circleColor;
  final VoidCallback? onTap;
  final bool showEditIcon;
  final bool showBorder;
  final VoidCallback? onRemovePhoto;
  final double borderWidth;
  final int badgeCount;
  final bool isCircular;

  const ImageBuilder({
    super.key,
    required this.url,
    required this.file,
    required this.onChanged,
    this.nameLetter = 'U',
    this.size,
    this.circleColor,
    this.onTap,
    this.showEditIcon = false,
    this.showBorder = true,
    this.onRemovePhoto,
    this.borderWidth = 1,
    this.badgeCount = 0,
    this.isCircular = false,
  });

  const ImageBuilder.url({
    super.key,
    required this.url,
    this.nameLetter = 'U',
    this.size,
    this.circleColor,
    this.onTap,
    this.showEditIcon = false,
    this.showBorder = true,
    this.onRemovePhoto,
    this.borderWidth = 1,
    this.badgeCount = 0,
    this.isCircular = false,
  })  : onChanged = null,
        file = null;

  @override
  Widget build(BuildContext context) {
    late final Widget imageWidget;

    // No image from backend and no image selected by user
    if (url == null && file == null) {
      imageWidget = Center(
        child: Text(
          nameLetter,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).primaryColor,
          ),
        ),
      );
    }
    // Image selected from gallery
    else if (file != null) {
      imageWidget = Image.file(
        File(file!.path),
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      );
    }
    // Image coming from backend
    else {
      imageWidget = CachedNetworkImage(
        imageUrl: url!,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
        placeholder: kImagePlaceHolder,
        errorWidget: kErrorWidget,
      );
    }

    final widget = GestureDetector(
      onTap: () async {
        if (onTap != null) {
          return onTap!.call();
        }
        if (onChanged == null) return;
      },
      child: Container(
        width: size?.width ?? 48,
        height: size?.width ?? 48,
        decoration: BoxDecoration(
          borderRadius:
              isCircular ? BorderRadius.circular(50) : BorderRadius.circular(8),
          color: Theme.of(context).cardColor,
          border: showBorder
              ? Border.all(
                  color: circleColor ?? Colors.black54,
                  width: borderWidth,
                )
              : null,
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: isCircular
                  ? BorderRadius.circular(50)
                  : BorderRadius.circular(6),
              child: imageWidget,
            ),
            if (showEditIcon)
              Align(
                alignment: Alignment.bottomRight,
                child: Transform.translate(
                  offset: const Offset(7, 7),
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.secondaryClr,
                      border: Border.all(
                        color: Theme.of(context).cardColor,
                        width: 2,
                      ),
                    ),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );

    if (badgeCount == 0) return widget;

    return Badge.count(
      count: badgeCount,
      backgroundColor: Theme.of(context).primaryColor,
      child: widget,
    );
  }
}
