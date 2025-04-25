import 'package:defendon/controllers/shared_preference_controller.dart';
import 'package:defendon/screens/onBoarding/onboarding_screen.dart';
import 'package:defendon/screens/tabs/user_tabs_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../utils/talker_with_extensions.dart';

class NavigationService extends GetxService {
  final navigatorKey = GlobalKey<NavigatorState>();

  Future<NavigationService> init() async {
    // Delay just enough to ensure app is properly initialized
    await Future.delayed(const Duration(milliseconds: 500));
    navigateBasedOnCondition();
    return this;
  }

  Future<void> navigateBasedOnCondition() async {
    try {
      'Starting navigation condition check'.log();

      final prefs = Get.find<SharedPreferencesService>();

      // First Launch Check - Show Onboarding
      final isFirstLaunch = prefs.showOnboarding;
      'First launch condition triggered 1: $isFirstLaunch'.log();

      if (isFirstLaunch) {
        'First launch condition triggered 2'.log();
        await navigateToOnboarding();
        return;
      }
      // ✅ After onboarding, check if user is logged in
      final isLoggedIn = prefs.isLoggedIn;
      'User logged in status: $isLoggedIn'.log();
      if (isLoggedIn) {
        // await navigateToHome();
      } else {
        await navigateToLogIn();
      }
    } catch (e) {
      'Unexpected error in navigation: $e'.log();
      await navigateToLogIn();
    }
  }

  Future<void> navigateToOnboarding() async {
    await navigateOffAll(OnboardingScreen());
  }

  Future<void> navigateToLogIn() async {
    await navigateOffAll(const UserTabsView());
  }

  Future<void> completeOnboarding() async {
    final prefs = Get.find<SharedPreferencesService>();
    await prefs.setOnboardingFalse();
    await navigateToLogIn();
  }

  Future<T?> navigateTo<T>(Widget child) async {
    return await navigatorKey.currentState!.push(
      MaterialPageRoute(builder: (context) => child),
    );
  }

  Future<T?> navigateOffAll<T>(Widget child) async {
    if (navigatorKey.currentState == null) {
      'Navigator state is NULL, delaying navigation'.log();
      await Future.delayed(const Duration(milliseconds: 250));
    }
    return await navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => child),
      (route) => false,
    );
  }

  Future<void> pop() async {
    HapticFeedback.selectionClick();
    navigatorKey.currentState!.pop();
  }

  Future<void> popUntilHome() async {
    HapticFeedback.selectionClick();
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
