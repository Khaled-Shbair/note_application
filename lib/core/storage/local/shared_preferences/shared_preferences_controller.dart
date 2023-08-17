import '/config/all_imports.dart';

enum PrefKeys {
  onBoarding,
  darkTheme,
  language,
}

class SharedPreferencesController {
  static final SharedPreferencesController _instance =
      SharedPreferencesController._();

  SharedPreferencesController._();

  late SharedPreferences _sharedPreferences;

  factory SharedPreferencesController() {
    return _instance;
  }

  Future<void> initSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setOnBoarding() async {
    await _sharedPreferences.setBool(PrefKeys.onBoarding.toString(), true);
  }

  Future<void> setDarkTheme(bool isDark) async {
    await _sharedPreferences.setBool(PrefKeys.darkTheme.toString(), isDark);
  }

  Future<void> setLanguage(String language) async {
    await _sharedPreferences.setString(PrefKeys.language.toString(), language);
  }

  bool get getOnBoarding =>
      _sharedPreferences.getBool(PrefKeys.onBoarding.toString()).onNull();

  bool get getDarkTheme =>
      _sharedPreferences.getBool(PrefKeys.darkTheme.toString()).onNull();

  String get getLanguage =>
      _sharedPreferences.getString(PrefKeys.language.toString()) ?? 'en';
}
