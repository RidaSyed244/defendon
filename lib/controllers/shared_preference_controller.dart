import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService extends GetxService {
  static const _onboardingKey = 'onboarding';
  static String userKey(String userId) => 'user-$userId';

  late SharedPreferences _prefs;

  Future<SharedPreferencesService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  bool get showOnboarding => _prefs.getBool(_onboardingKey) ?? true;
  bool get isLoggedIn => _prefs.getString('token') != null;

  Future<void> setOnboardingFalse() async {
    await _prefs.setBool(_onboardingKey, false);
  }
}
