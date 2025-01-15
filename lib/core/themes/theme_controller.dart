import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

// ThemeController class to manage theme changes
class ThemeController {
  // Change the theme between light and dark modes
  static changeTheme(BuildContext context) {
    // Get the current theme mode (dark or light)
    bool mode = AdaptiveTheme.of(context).mode.isDark;

    // If the current mode is dark, switch to light mode
    if (mode) {
      AdaptiveTheme.of(context).setLight();
    }
    // If the current mode is light, switch to dark mode
    else {
      AdaptiveTheme.of(context).setDark();
    }
  }
}
