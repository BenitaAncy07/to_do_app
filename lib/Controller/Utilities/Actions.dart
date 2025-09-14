import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/Controller/Constants/AppConstants.dart';

//=========================initial check in splashscreen==============================
initialcheck(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  if (prefs.getString(themetext) == darktext) {
    AdaptiveTheme.of(context).setDark();
  }
}
