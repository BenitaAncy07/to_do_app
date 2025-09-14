import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/Material.dart';
import 'package:to_do_app/Controller/Constants/UiConstants.dart';
import 'package:to_do_app/Controller/Utilities/Hexconversion.dart';
import 'package:to_do_app/View/Helpers/ColorContents.dart';
import 'package:to_do_app/View/Helpers/FontContents.dart';

exitdialogbox(BuildContext context) {
  showDialog<bool>(
    context: context,
    builder:
        (context) => AlertDialog(
          backgroundColor:
              AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                  ? lighttheme
                  : darktheme,
          title: Text(
            exitheading,
            style: TextStyle(
              fontSize: textsize7,
              color: hexToColor(goldencolor),
              fontFamily: headingfont,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            exitcontent,
            style: TextStyle(
              fontSize: textsize5,
              color:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? black
                      : lighttheme,
              fontFamily: headingfont,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text(
                nobuttontext,
                style: TextStyle(
                  fontSize: textsize5,
                  color: hexToColor(goldencolor),
                  fontFamily: headingfont,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                exit(0);
              },
              child: Text(
                yesbuttontext,
                style: TextStyle(
                  fontSize: textsize5,
                  color: hexToColor(goldencolor),
                  fontFamily: headingfont,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
  );
}
