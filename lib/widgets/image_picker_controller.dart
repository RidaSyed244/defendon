import 'dart:async';

import 'package:defendon/utils/extensions.dart';
import 'package:defendon/utils/padding_extensions.dart';
import 'package:defendon/utils/sheet_extensions.dart';
import 'package:defendon/utils/talker_with_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService extends GetxController {
  XFile? imageFile;

  Future<XFile?> pickImage({
    bool shouldCompress = true,
    bool shouldCrop = true,
    String? title,
    String? button1Text,
    String? button2Text,
    String? cancelButtonText,
    Function? onRemove,
  }) async {
    final imageFiles = await showChoicesAndGetImage(
      allowMultiples: false,
      title: title,
      button1Text: button1Text,
      button2Text: button2Text,
      cancelButtonText: cancelButtonText,
      onRemove: onRemove,
    );

    if (imageFiles == null || imageFiles.isEmpty) return null;

    imageFile = imageFiles.first;
    return imageFile;
  }

  Future<List<XFile>?> pickImages({
    bool shouldCompress = true,
    bool shouldCrop = true,
    String? title,
    String? button1Text,
    String? button2Text,
    String? cancelButtonText,
  }) async {
    final imageFiles = await showChoicesAndGetImage(
      allowMultiples: true,
      title: title,
      button1Text: button1Text,
      button2Text: button2Text,
      cancelButtonText: cancelButtonText,
    );

    if (imageFiles == null || imageFiles.isEmpty) return null;

    return imageFiles;
  }

  Future<List<XFile>?> showChoicesAndGetImage({
    required bool allowMultiples,
    String? title,
    String? button1Text,
    String? button2Text,
    String? cancelButtonText,
    Function? onRemove,
    bool cropImage = true,
    bool isImageValidation = true,
  }) async {
    final context = Get.context!;

    Future<List<XFile>?> processImages(List<XFile> pickedImages) async {
      final processedImages = <XFile>[];

      for (final image in pickedImages) {
        XFile processedImage = image;

        if (cropImage) {
          final croppedImage = await _cropImage(image);
          if (croppedImage == null) {
            _showAlert(
                title: 'Error occurred',
                message: 'Facing issue in cropped image');
            return null;
          }
          processedImage = croppedImage;
        }
        processedImages.add(processedImage);
      }

      return processedImages.isEmpty ? null : processedImages;
    }

    return context.showPrimarySheet(
      title: title ?? 'Change profile photo',
      child: Column(
        children: [
          InkWell(
            onTap: () async {
              final pickedImage = await ImagePicker().pickImage(
                source: ImageSource.camera,
                imageQuality: 20,
              );
              if (pickedImage != null) {
                final processedImages = await processImages([pickedImage]);
                if (processedImages != null) {
                  Navigator.pop(context, processedImages);
                }
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Take a photo',
                ).p16()
              ],
            ),
          ),
          Divider(height: 0, color: context.adaptive12),
          InkWell(
            onTap: () async {
              final images = allowMultiples
                  ? await ImagePicker().pickMultiImage(imageQuality: 20)
                  : [await ImagePicker().pickImage(source: ImageSource.gallery)]
                      .whereType<XFile>()
                      .toList();

              if (images.isNotEmpty) {
                final processedImages = await processImages(images);
                if (processedImages != null) {
                  Navigator.pop(context, processedImages);
                }
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Choose from gallery',
                ).p16()
              ],
            ),
          ),
          Divider(height: 0, color: context.adaptive12),
          InkWell(
            onTap: () => Navigator.pop(context, null),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Cancel',
                ).p16()
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showAlert({required String title, String? message}) {
    Get.defaultDialog(
        title: title,
        middleText: message ?? '',
        textConfirm: "OK",
        onConfirm: () => Get.back());
  }

  Future<XFile?> _cropImage(XFile imageFile) async {
    try {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 20,
      );

      if (croppedFile == null) return null;

      return XFile(croppedFile.path);
    } catch (e) {
      ('Error during cropping: $e').log();
    }
    return null;
  }
}
