import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/init/theme/app_theme_light.dart';

import '../../enums/app_themes.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;

  /// [_currentTheme] change here with saved theme to locale

  ThemeData get currentTheme => _currentTheme;

  void changeTheme(AppThemes appTheme) {
    if (appTheme == AppThemes.LIGHT) {
      _currentTheme = ThemeData.light();
    } else {
      // dark theme
      _currentTheme = ThemeData.dark();
    }
    notifyListeners();
  }
}
 