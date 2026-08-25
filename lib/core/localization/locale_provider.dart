import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  String _currentLocale = "tr";
  String get currentLocale => _currentLocale;

  void setLocale(String langCode) {
    if (_currentLocale != langCode) {
      _currentLocale = langCode;
      notifyListeners();
    }
  }
}