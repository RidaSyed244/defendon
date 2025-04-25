// ignore_for_file: deprecated_member_use, unused_element

import 'dart:async';

import 'package:defendon/utils/extensions.dart';
import 'package:defendon/utils/widget_utility_extensions.dart';
import 'package:flutter/material.dart';

import '../widgets/primary_button.dart';

extension AlertExtensions on BuildContext {
  Future<T?> showPrimarySheet<T>({
    String? title,
    required Widget child,
    bool removeMargin = false,
  }) {
    return PrimarySheet.show<T>(
      this,
      removePadding: removeMargin,
      title: title,
      child: child,
    );
  }

  Future<T?> showConfirmationSheet<T>({
    required String title,
    required String message,
    IconData? icon,
    Widget? iconWidget,
    String positiveButtonText = 'Okay',
    Color? circleColor,
    Color? iconColor,
    String? negativeButtonText,
    FutureOr<dynamic> Function()? onPositiveAction,
    FutureOr<dynamic> Function()? onNegativeAction,
    Color? positiveButtonColor,
    Color? negativeButtonColor,
  }) {
    return PrimarySheet.show(
      this,
      child: _ConfirmationSheet(
        title: title,
        message: message,
        icon: icon ?? Icons.info_outline_rounded,
        iconWidget: iconWidget,
        circleColor: circleColor,
        iconColor: iconColor,
        positiveButtonText: positiveButtonText,
        negativeButtonText: negativeButtonText,
        onNegativeAction: onNegativeAction,
        onPositiveAction: onPositiveAction,
        positiveButtonColor: positiveButtonColor,
        negativeButtonColor: negativeButtonColor,
      ),
    );
  }

  Future<T?> showSuccessSheet<T>({
    required String title, //Main text in the bottom sheet
    required String
        message, // Description of more than 1 line you want to show under title
    Widget? iconWidget, // Icon widget at top left corner of bottom bar
    IconData icon = Icons
        .check_circle_outline_rounded, // Default icon which is using in success sheet
    String positiveButtonText = 'Close', // Default button text in success sheet
    Color? iconColor = Colors.green, // default color of icon
    Color?
        circleColor, // Color of circle in which icon is wrapped(By default Icon will be wrapped in a circle)
    Color?
        positiveButtonColor, //Color of button in success sheet by default it's color is primary color
    FutureOr<dynamic> Function()?
        onPositiveAction, // Action you want to perform by clickling button
  }) {
    return PrimarySheet.show(
      this,
      child: _ConfirmationSheet(
        title: title,
        message: message,
        positiveButtonColor: positiveButtonColor,
        iconWidget: iconWidget,
        icon: icon,
        circleColor: circleColor ?? Colors.green.withOpacity(0.2),
        iconColor: iconColor,
        positiveButtonText: positiveButtonText,
        onPositiveAction: onPositiveAction,
      ),
    );
  }

  Future<T?> showErrorSheet<T>({
// IN Error sheet we have 2 buttons
// 1st button is Positive button
// 2nd button is negative button ( By Default Cancel button)
    required String title, //Main text in the bottom sheet
    required String
        message, // Description of more than 1 line you want to show under title
    Widget? iconWidget, // Icon at top left corner of bottom bar
    IconData icon =
        Icons.error_outline, // Default icon which is using in error sheet
    Color? iconColor = Colors.red, // default color of icon
    Color?
        circleColor, // Color of circle in which icon is wrapped(By default Icon will be wrapped in a circle)
    Color? negativeButtonColor = Colors
        .grey, //Color of 2nd(Cancel) button in error sheet by default it's color is grey color
    String? negativeButtonText, // 2nd button text in error sheet
    FutureOr<dynamic> Function()?
        onNegativeAction, // Action you want to perform by clickling 2nd(Cancel) button... By default it will close the sheet
    String? positiveButtonText, // 1st button text in error sheet
    FutureOr<dynamic> Function()?
        onPositiveAction, // Action you want to perform by clickling 1st button in error sheet
    Color? positiveButtonColor = Colors
        .red, //Color of 1st button in error sheet by default it's color is red color
    bool showCheckbox = false,
    String? checkboxText,
    bool initialCheckboxValue = false,
    Function(bool)? onCheckboxChanged,
    Color? negativeTextColor,
  }) {
    return PrimarySheet.show(
      this,
      child: _ConfirmationSheet(
        title: title,
        positiveButtonColor: positiveButtonColor,
        positiveButtonText: positiveButtonText,
        onPositiveAction: onPositiveAction,
        negativeButtonColor: negativeButtonColor,
        message: message,
        icon: icon,
        circleColor: circleColor,
        iconColor: iconColor,
        iconWidget: iconWidget,
        negativeButtonText: negativeButtonText,
        onNegativeAction: onNegativeAction,
        showCheckbox: showCheckbox,
        checkboxText: checkboxText,
        initialCheckboxValue: initialCheckboxValue,
        onCheckboxChanged: onCheckboxChanged,
        negativeTextColor: negativeTextColor,
      ),
    );
  }
}

class PrimarySheet extends StatelessWidget {
  final String? title;
  final Widget child;
  final bool? removeMargin;

  const PrimarySheet({
    super.key,
    this.title,
    required this.child,
    this.removeMargin,
  });

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding + 4),
      child: Container(
        margin: removeMargin == true
            ? EdgeInsets.zero
            : EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 24),
        child: Material(
          color: context.cardColor,
          elevation: 8,
          shadowColor: Colors.black.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(32),
              bottom: Radius.circular(removeMargin == true ? 0 : 32),
            ),
          ),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null) ...[
                  SizedBox(height: 12),
                  Text(
                    title!,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Divider(height: 0, color: context.adaptive12),
                ],
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Future<T?> show<T>(
    context, {
    String? title,
    required Widget child,
    bool? removePadding,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: removePadding == true ? null : Colors.transparent,
      builder: (context) => PrimarySheet(
        title: title,
        removeMargin: removePadding,
        child: child,
      ),
    );
  }
}

class _ConfirmationSheet extends StatefulWidget {
  final String title;
  final String message;
  final Widget? iconWidget;
  final IconData icon;
  final Color? circleColor;
  final Color? iconColor;
  final String? positiveButtonText;
  final String? negativeButtonText;
  final FutureOr<dynamic> Function()? onPositiveAction;
  final FutureOr<dynamic> Function()? onNegativeAction;
  final Color? positiveButtonColor;
  final Color? negativeButtonColor;
  final bool showCheckbox;
  final String? checkboxText;
  final bool initialCheckboxValue;
  final Function(bool)? onCheckboxChanged;
  final Color? negativeTextColor;
  const _ConfirmationSheet({
    required this.title,
    required this.message,
    this.iconWidget,
    required this.icon,
    this.positiveButtonText,
    this.circleColor,
    this.iconColor,
    this.negativeButtonText,
    this.onPositiveAction,
    this.onNegativeAction,
    this.positiveButtonColor,
    this.negativeButtonColor,
    this.showCheckbox = false,
    this.checkboxText,
    this.initialCheckboxValue = false,
    this.onCheckboxChanged,
    this.negativeTextColor,
  });

  @override
  _ConfirmationSheetState createState() => _ConfirmationSheetState();
}

class _ConfirmationSheetState extends State<_ConfirmationSheet> {
  bool isPositiveActionLoading = false;
  bool isNegativeActionLoading = false;
  bool isChecked = false;

  void handlePositiveAction() async {
    if (widget.onPositiveAction != null) {
      setState(() {
        isPositiveActionLoading = true;
      });
      try {
        await widget.onPositiveAction!();
      } finally {
        setState(() {
          isPositiveActionLoading = false;
        });
      }
    } else {
      Navigator.of(context).pop(true);
    }
  }

  void handleNegativeAction() async {
    if (widget.onNegativeAction != null) {
      setState(() {
        isNegativeActionLoading = true;
      });
      try {
        await widget.onNegativeAction!();
      } finally {
        setState(() {
          isNegativeActionLoading = false;
        });
      }
    } else {
      Navigator.of(context).pop(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> actions = [];

    actions.add(
      PrimaryButton(
        color: widget.positiveButtonColor,
        onTap: handlePositiveAction,
        text:
            isPositiveActionLoading ? 'Loading...' : widget.positiveButtonText,
        isOutline: false,
        isLoading: isPositiveActionLoading,
      ).expand(),
    );

    if (widget.negativeButtonText == null) {
      // For single button
      actions = [
        PrimaryButton(
          color: widget.positiveButtonColor,
          onTap: handlePositiveAction,
          text: isPositiveActionLoading
              ? 'Loading...'
              : (widget.positiveButtonText ?? 'OK'),
          isOutline: false,
          isLoading: isPositiveActionLoading,
        ),
      ];
    } else {
      actions = [
        // First button in error sheet
        PrimaryButton(
          color: widget.positiveButtonColor,
          onTap: handlePositiveAction,
          text: isPositiveActionLoading
              ? 'Loading...'
              : (widget.positiveButtonText ?? 'OK'),
          isOutline: false,
          isLoading: isPositiveActionLoading,
        ),
        SizedBox(height: 12),
        // Second button (Cancel button) in error sheet
        PrimaryButton(
          color: widget.negativeButtonColor ?? context.adaptive,
          onTap: widget.onNegativeAction ?? () => Navigator.pop(context, false),
          text: isNegativeActionLoading
              ? 'Loading...'
              : (widget.negativeButtonText ?? 'Cancel'),
          isOutline: true,
          textColor: widget.negativeTextColor ?? Colors.black,
          isLoading: isNegativeActionLoading,
        ),
      ];
    }

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 24),
          if (widget.iconWidget != null) ...[
            widget.iconWidget!,
          ] else ...[
            // Circular icon
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.circleColor ??
                          widget.iconColor?.withOpacity(0.2) ??
                          context.adaptive12,
                    ),
                    child: Icon(
                      widget.icon,
                      size: 32,
                      color: widget.iconColor ?? context.primaryColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      size: 32,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
          ],

          // Title and message
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                // letterSpacing: 0.5,
              ),
            ),
          ),
          SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Text(
              widget.message,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
          ),
          if (widget.showCheckbox && widget.checkboxText != null) ...[
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                      widget.onCheckboxChanged?.call(value ?? false);
                    },
                  ),
                  Expanded(
                    child: Text(
                      widget.checkboxText!,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],

          SizedBox(height: 20),
          // Actions
          // ...actions,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(children: actions),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
