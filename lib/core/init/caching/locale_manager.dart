import 'package:shared_preferences/shared_preferences.dart';

class LocaleDbManager {
  static final LocaleDbManager _instance = LocaleDbManager._init();
  SharedPreferences? _preferences;
  static LocaleDbManager get instance => _instance;

  LocaleDbManager._init();

  static preferencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
    return instance._preferences;
  }

  Future<void> setStringValue(PreferencesKey PreferencesKey, String value) async {
    await _preferences?.setString(PreferencesKey.name, value);
  }

  String getStringValue(PreferencesKey key) {
    return _preferences?.getString(key.name) ?? '';
  }

  Future<void> setBoolValue(PreferencesKey PreferencesKey, bool value) async {
    await _preferences?.setBool(PreferencesKey.name, value);
  }

  bool getBoolValue(PreferencesKey key, {bool defaultValue = false}) {
    return _preferences?.getBool(key.name) ?? defaultValue;
  }

  Future<void> setIntValue(PreferencesKey PreferencesKey, int value) async {
    await _preferences?.setInt(PreferencesKey.name, value);
  }

  int getIntValue(PreferencesKey key, {int defaultValue = 0}) {
    return _preferences?.getInt(key.name) ?? defaultValue;
  }

  Future<void> setDoubleValue(PreferencesKey PreferencesKey, double value) async {
    await _preferences?.setDouble(PreferencesKey.name, value);
  }

  double getDoubleValue(PreferencesKey key, {double defaultValue = 0.0}) {
    return _preferences?.getDouble(key.name) ?? defaultValue;
  }
}

enum PreferencesKey { token } // todo add here new values

extension PreferencesKeyExt on PreferencesKey {
  LocaleDbManager get localeDbManager => LocaleDbManager.instance;
  getStringValue() => localeDbManager.getStringValue(this);
  getBoolValue() => localeDbManager.getBoolValue(this);
  getIntValue() => localeDbManager.getIntValue(this);
  getDoubleValue() => localeDbManager.getDoubleValue(this);
}


