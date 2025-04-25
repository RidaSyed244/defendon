import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

import 'app_colors.dart';

extension BuildContextExtended on BuildContext {
  Color get adaptive05 => Theme.of(this).dividerColor.withValues(alpha: 0.05);
  Color get adaptive07 => Theme.of(this).dividerColor.withValues(alpha: 0.07);
  Color get adaptive12 => Theme.of(this).dividerColor.withValues(alpha: 0.12);
  Color get adaptive26 => Theme.of(this).dividerColor.withValues(alpha: 0.26);
  Color get adaptive38 => Theme.of(this).dividerColor.withValues(alpha: 0.38);
  Color get adaptive45 => Theme.of(this).dividerColor.withValues(alpha: 0.45);
  Color get adaptive54 => Theme.of(this).dividerColor.withValues(alpha: 0.54);
  Color get adaptive60 => Theme.of(this).dividerColor.withValues(alpha: 0.60);
  Color get adaptive70 => Theme.of(this).dividerColor.withValues(alpha: 0.70);
  Color get adaptive75 => Theme.of(this).dividerColor.withValues(alpha: 0.75);
  Color get adaptive87 => Theme.of(this).dividerColor.withValues(alpha: 0.87);
  Color get adaptive => Theme.of(this).dividerColor;

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  Color get cardColor => Theme.of(this).cardColor;
  Color get primaryColor => Theme.of(this).primaryColor;

  ThemeData get theme => Theme.of(this);
}

extension ExtendedStringExtension on String {
  String get spacedNewLine => split(' ').map((e) => '$e\n').toList().join();

  Color toColor() {
    var hexColor = replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    if (hexColor.length == 8) {
      return Color(int.parse('0x$hexColor'));
    }
    return AppColors.primary;
  }
}

extension ExtendedNullStringExtension on String? {
  bool get isBlank => this == null || (this?.isEmpty ?? false);
  bool get isNotBlank => this != null || (this?.isNotEmpty ?? false);
}

extension ExtendedNullList on List? {
  bool get isBlank => this == null || (this?.isEmpty ?? false);
  bool get isNotBlank => this != null || (this?.isNotEmpty ?? false);
  bool get allNotNull => !allNull;
  bool get allNull => this!.every((e) => e == null);
}

extension ExtendedRandom on Random {
  int randomUpto(int max) => 0 + nextInt(max - 0);
}

extension ExtendedWidget on Widget {
  SliverToBoxAdapter toBoxAdapter() {
    return SliverToBoxAdapter(child: this);
  }
}

extension ExtendedDateTimeExtension<T> on DateTime {
  bool get isSameAsToday {
    final today = DateTime.now();
    return (day == today.day && month == today.month && year == today.year);
  }

  bool get isNotSameAsToday {
    return !isSameAsToday;
  }

  bool matchDate(DateTime today) {
    return (day == today.day && month == today.month && year == today.year);
  }

  bool get isSameMonth =>
      month == DateTime.now().month && year == DateTime.now().year;
}

extension ExtendedFile on File {
  String get filename => path.basename(this.path);
  String get uploadFileName =>
      '${DateTime.now().millisecondsSinceEpoch}~~$filename';
}

extension ExtendedDirectory on Directory {
  String getTemporaryFilePath({required String extension}) {
    return '${absolute.path}/${DateTime.now().millisecondsSinceEpoch}.$extension';
  }
}

extension ExtendedWidgetNum on num {
  double sh(BuildContext context) => MediaQuery.of(context).size.height * this;
  double sw(BuildContext context) => MediaQuery.of(context).size.width * this;
}
