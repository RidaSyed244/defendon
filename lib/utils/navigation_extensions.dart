import 'package:flutter/material.dart';

extension NavigationExtensions on BuildContext {
  ///
  /// Pushes the built widget to the screen using the material fade in animation
  ///
  Future<T?> nextPage<T>(
    Widget page, {
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool barrierDismissible = false,
  }) {
    //
    return Navigator.of(this).push(
      MaterialPageRoute(
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
        barrierDismissible: barrierDismissible,
        builder: (context) => page,
      ),
    );
  }

  /// Pushes and replacing the built widget to the screen using the material fade in animation
  Future<T?> nextReplacementPage<T>(
    Widget page, {
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool barrierDismissible = false,
  }) {
    //
    return Navigator.of(this).pushReplacement(
      MaterialPageRoute(
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
        barrierDismissible: barrierDismissible,
        builder: (context) => page,
      ),
    );
  }

  /// Removing all the widgets till defined rule, and pushes the built widget to the screen using the material fade in animation
  Future<T?> nextAndRemoveUntilPage<T>(
    Widget page, {
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool barrierDismissible = false,
  }) {
    //
    return Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
        barrierDismissible: barrierDismissible,
        builder: (context) => page,
      ),
      (route) => false,
    );
  }
}
