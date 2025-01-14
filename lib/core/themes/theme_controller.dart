import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class ThemeController {
  static changeTheme(BuildContext context) {
    bool mode = AdaptiveTheme.of(context).mode.isDark;
    if (mode) {
      AdaptiveTheme.of(context).setLight();
    } else {
      AdaptiveTheme.of(context).setDark();
    }
  }
}
