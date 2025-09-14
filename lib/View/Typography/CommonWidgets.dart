import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/Controller/Constants/UiConstants.dart';
import 'package:to_do_app/Controller/Utilities/Hexconversion.dart';
import 'package:to_do_app/View/Helpers/ColorContents.dart';
import 'package:to_do_app/View/Helpers/FontContents.dart';
import 'package:to_do_app/View/Helpers/IconContents.dart';

//==============================Header widget==========================
Widget headerwidget(BuildContext context, String heading, a) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              a(true);
            },
            icon: Icon(
              size: iconsize2,
              closeicon,
              color:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? black
                      : lighttheme,
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            heading.toUpperCase(),
            style: TextStyle(
              fontSize: textsize5,
              color: hexToColor(goldencolor),
              fontFamily: headingfont,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      Divider(thickness: 1, color: hexToColor(goldencolor)),
    ],
  );
}

//====================================Text widget=======================
Widget textwidget(BuildContext context, String heading, int starrequired) {
  return RichText(
    text: TextSpan(
      text: heading,
      style: TextStyle(
        fontSize: textsize5,
        color:
            AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                ? black
                : lighttheme,
        fontFamily: headingfont,
        fontWeight: FontWeight.bold,
      ),
      children: [
        if (starrequired == 1)
          TextSpan(
            text: ' *',
            style: TextStyle(
              fontSize: textsize3,
              color: red,
              fontFamily: headingfont,
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
    ),
  );
}

//=================================Textbox widget==================
Widget textboxwidget(
  BuildContext context,
  _formKey,
  TextEditingController textbox1controller,
  FocusNode box1Focus,
  int starrequired,
  int maxline,
  String fieldname,
  String labeltext,
  String hinttext,
  fieldsubmit,
) {
  return Container(
    padding: EdgeInsets.all(10),
    child: Form(
      key: _formKey,
      child: TextFormField(
        controller: textbox1controller,
        focusNode: box1Focus,
        onFieldSubmitted: (_) {
          fieldsubmit(true);
        },
        textInputAction: TextInputAction.next,
        maxLines: maxline,
        cursorColor: hexToColor(goldencolor),
        style: TextStyle(
          fontSize: textsize3,
          fontFamily: headingfont,
          color:
              AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                  ? black
                  : lighttheme,
        ),
        decoration: InputDecoration(
          counterText: '',
          labelText: labeltext,
          hintText: hinttext,
          hintStyle: TextStyle(
            fontSize: textsize1,
            fontFamily: headingfont,
            color:
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                    ? black.withOpacity(0.3)
                    : lighttheme.withOpacity(0.3),
            fontStyle: FontStyle.italic,
          ),
          labelStyle: TextStyle(
            fontSize: textsize1,
            fontFamily: headingfont,
            color: hexToColor(goldencolor),

            fontStyle: FontStyle.italic,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: hexToColor(goldencolor), width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: hexToColor(goldencolor), width: 1.0),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: red, width: 1.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: red, width: 1.2),
          ),
        ),
        onChanged: (value) {
          _formKey.currentState!.validate();
        },
        validator: (value) {
          if (starrequired == 1 && (value == null || value.isEmpty)) {
            return requiredfieldtext;
          }
          return null;
        },
      ),
    ),
  );
}
