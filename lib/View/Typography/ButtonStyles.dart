//================================Floating action button with icon and text=================
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/Controller/Constants/UiConstants.dart';
import 'package:to_do_app/Controller/Utilities/Hexconversion.dart';
import 'package:to_do_app/View/Helpers/ColorContents.dart';
import 'package:to_do_app/View/Helpers/FontContents.dart';
import 'package:to_do_app/View/Helpers/IconContents.dart';

Widget floatingbutton(BuildContext context, iconval, String buttontext, a) {
  return FloatingActionButton(
    backgroundColor: hexToColor(goldencolor),
    onPressed: () {
      a(true);
    },
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconval,
            color:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? black
                    : lighttheme,
            size: iconsize1,
          ),
          Text(
            buttontext,
            style: TextStyle(
              fontSize: buttontextsize2,
              color:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? black
                      : lighttheme,
              fontFamily: headingfont,
            ),
          ),
        ],
      ),
    ),
  );
}

//===============================Save button widget====================
Widget savebuttonwidget(BuildContext context, a) {
  return Column(
    children: [
      Divider(thickness: 1, color: hexToColor(goldencolor)),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: hexToColor(goldencolor),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          onPressed: () {
            a(true);
          },
          child: Text(
            savebuttontext,
            style: TextStyle(
              fontSize: buttontextsize1,
              color:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? black
                      : lighttheme,
              fontFamily: headingfont,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  );
}
