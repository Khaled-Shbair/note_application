import '../../../../core/extensions/extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys {
  onBoarding,
  darkTheme,
  language,
}

class SharedPreferencesController {
  static final SharedPreferencesController _instance =
      SharedPreferencesController._();

  SharedPreferencesController._();

  static late SharedPreferences _sharedPreferences;

  factory SharedPreferencesController() {
    return _instance;
  }

  static Future<void> initSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> setOnBoarding() async {
    await _sharedPreferences.setBool(PrefKeys.onBoarding.toString(), true);
  }

  static Future<void> setDarkTheme(bool isDark) async {
    await _sharedPreferences.setBool(PrefKeys.darkTheme.toString(), isDark);
  }

  static Future<void> setLanguage(String language) async {
    await _sharedPreferences.setString(PrefKeys.language.toString(), language);
  }

  static bool get getOnBoarding =>
      _sharedPreferences.getBool(PrefKeys.onBoarding.toString()).onNull();

  static bool get getDarkTheme =>
      _sharedPreferences.getBool(PrefKeys.darkTheme.toString()).onNull();

  static String get getLanguage =>
      _sharedPreferences.getString(PrefKeys.language.toString()) ?? 'en';
}
