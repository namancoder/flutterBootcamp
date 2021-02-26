import 'package:flutter/material.dart';
import 'package:music_app/config.dart';

class MyTheme with ChangeNotifier {
  static bool _isDark = true;

  MyTheme() {
    if (box.containsKey('currentTheme'))
      _isDark = box.get('currentTheme');
    else {}
  }

  ThemeMode currentTheme() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme() {
    _isDark = !_isDark;
    box.put('currentTheme', _isDark);

    notifyListeners();
  }
}
