import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/View/Helpers/ColorContents.dart';
import 'package:to_do_app/View/Typography/Appbar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
              ? lighttheme
              : darktheme,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: appbar2(context),
      ),
    );
  }
}
