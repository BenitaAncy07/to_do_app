import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:to_do_app/Controller/Constants/UiConstants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light().copyWith(),
      dark: ThemeData.dark().copyWith(),
      initial: AdaptiveThemeMode.light,
      builder:
          (theme, darkTheme) =>
              MaterialApp(title: appname, debugShowCheckedModeBanner: false),
    );
  }
}
