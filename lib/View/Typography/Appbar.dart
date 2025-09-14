import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/Controller/Constants/UiConstants.dart';
import 'package:to_do_app/Controller/Utilities/Actions.dart';
import 'package:to_do_app/Controller/Utilities/Hexconversion.dart';
import 'package:to_do_app/View/Helpers/ColorContents.dart';
import 'package:to_do_app/View/Helpers/FontContents.dart';
import 'package:to_do_app/View/Helpers/IconContents.dart';
import 'package:to_do_app/View/Helpers/ImageContents.dart';

Widget appbar2(BuildContext context) {
  return AppBar(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: hexToColor(goldencolor),
    ),

    backgroundColor:
        AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
            ? lighttheme
            : darktheme,
    leading: Padding(
      padding: EdgeInsets.only(left: 5),
      child: Image.asset(splashlogo),
    ),
    title: Text(
      homescreenheading,
      style: TextStyle(
        fontSize: textsize5,
        color: hexToColor(goldencolor),
        fontFamily: headingfont,
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: () {
          themechange(context);
        },
        icon: Icon(
          AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
              ? lighticon
              : darkicon,
          color: hexToColor(goldencolor),
          size: iconsize1,
        ),
      ),
    ],
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(4.0),
      child: Container(color: hexToColor(goldencolor), height: 1),
    ),
  );
}
