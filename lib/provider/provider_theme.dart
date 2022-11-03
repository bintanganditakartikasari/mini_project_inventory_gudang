import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeChanger extends ChangeNotifier {
  late ThemeData _selectedTheme;

  ThemeData dark = ThemeData.dark().copyWith(
    primaryColor: Colors.white,
  );

  ThemeData light = ThemeData.light().copyWith(
    primaryColor: Colors.black
  );

  ThemeChanger({required bool isDarkTheme}) {
    _selectedTheme = isDarkTheme ? dark : light;
  } 

  // ignore: non_constant_identifier_names
  ThemeCharger(bool darkThemeOn) {
    _selectedTheme = darkThemeOn ? dark : light;
  }

  Future<void> swapTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_selectedTheme == dark) {
      _selectedTheme = light;
      prefs.setBool("darkTheme", false);
    } else {
      _selectedTheme = dark;
      prefs.setBool("darkTheme", true);
    }

    notifyListeners();
  }

  ThemeData getTheme() => _selectedTheme;
}