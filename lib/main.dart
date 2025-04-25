import 'package:defendon/controllers/navigation_controller.dart';
import 'package:defendon/controllers/shared_preference_controller.dart';
import 'package:defendon/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PaintingBinding.instance.imageCache.maximumSizeBytes = 1000 << 20;

  // Lock to portrait mode
  await _setPortraitMode();

  await Get.putAsync(() => SharedPreferencesService().init());
  await Get.putAsync(
      () => NavigationService().init()); 

  runApp(const MyApp());
}

Future<void> _setPortraitMode() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
