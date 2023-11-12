
import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import '../../constants/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/shared_preference_helper.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme =
      MyTheme.lightTheme; // Use your light theme as the initial theme

  ThemeData get currentTheme => _currentTheme;

  ThemeProvider._() {
    loadTheme();
  }

  // Singleton instance
  static final ThemeProvider _instance = ThemeProvider._();

  // Factory constructor to provide access to the singleton instance
  factory ThemeProvider() {
    return _instance;
  }

  Future<ThemeData> loadTheme() async {
    // Load the theme preference from shared preferences when the model is created
    final themePreference = await SharedPreferenceHelper.getAppTheme();
    _currentTheme = themePreference == AppThemes.darkTheme
        ? MyTheme.darkTheme
        : MyTheme.lightTheme;
    notifyListeners();
    return _currentTheme;
  }

  void toggleTheme() async {
    _currentTheme = _currentTheme == MyTheme.lightTheme
        ? MyTheme.darkTheme
        : MyTheme.lightTheme;
    await SharedPreferenceHelper.saveAppTheme(_currentTheme == MyTheme.darkTheme
        ? AppThemes.darkTheme
        : AppThemes.lightTheme);
    notifyListeners();
  }
}
