import 'package:flutter/material.dart';
import 'package:simple_flutter_app/blocs/theme/theme_state.dart';

ThemeData themeLight(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
  );
}

ThemeData themeDark(BuildContext context) {
  return ThemeData(
    brightness: Brightness.dark,
  );
}

ThemeData buildTheme(BuildContext context, int brightness) {
  if (brightness == lightMode) {
    return themeLight(context);
  }
  return themeDark(context);
}
