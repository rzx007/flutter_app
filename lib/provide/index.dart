import 'package:flutter/material.dart';

class ThemeProvide with ChangeNotifier {
  int _themeIndex;

  int get getValue => _themeIndex;

  ThemeProvide();

  void setTheme(int index) async {
    _themeIndex = index;
    notifyListeners();
  }

}