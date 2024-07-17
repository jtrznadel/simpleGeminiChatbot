import 'package:flutter/material.dart';
import 'package:simple_chatbot/constants/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = AppTheme.lightTheme;
  bool _isThemeLight = true;

  ThemeData get themeData => _themeData;
  bool get isLightTheme => _isThemeLight;

  void toggleTheme() {
    if (_isThemeLight) {
      _themeData = AppTheme.darkTheme;
    } else {
      _themeData = AppTheme.lightTheme;
    }
    _isThemeLight = !_isThemeLight;
    notifyListeners();
  }
}
