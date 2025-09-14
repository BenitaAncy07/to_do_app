import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/Controller/Utilities/Actions.dart';
import 'package:to_do_app/View/Helpers/ColorContents.dart';
import 'package:to_do_app/View/Typography/ButtonStyles.dart';
import 'package:to_do_app/View/Typography/CommonWidgets.dart';

//==========================================Bottomsheet 1====================================
void bottomSheet1(
  BuildContext context,
  String heading,
  List textfieldheading,
  List starrequired,
  submitaction,
) {
  final formKey1 = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();
  FocusNode box1Focus = FocusNode();
  FocusNode box2Focus = FocusNode();
  TextEditingController textbox1controller = TextEditingController();
  TextEditingController textbox2controller = TextEditingController();
  showModalBottomSheet(
    isDismissible: false,
    backgroundColor:
        AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
            ? lighttheme
            : darktheme,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                headerwidget(context, heading, (a) {
                  closeaction(context);
                }),

                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textwidget(context, textfieldheading[0], starrequired[0]),
                      textboxwidget(
                        context,
                        formKey,
                        textbox1controller,
                        box1Focus,
                        starrequired[0],
                        1,
                        textfieldheading[0],
                        "",
                        "",
                        (a) {
                          FocusScope.of(context).requestFocus(box2Focus);
                        },
                      ),

                      textwidget(context, textfieldheading[1], starrequired[1]),

                      textboxwidget(
                        context,
                        formKey1,
                        textbox2controller,
                        box2Focus,
                        starrequired[1],
                        1,
                        textfieldheading[1],
                        "",
                        "",

                        (a) {
                          if (formKey.currentState!.validate() &&
                              formKey1.currentState!.validate()) {
                            submitaction(
                              textbox1controller.text,
                              textbox2controller.text,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                savebuttonwidget(context, (a) {
                  if (formKey.currentState!.validate() &&
                      formKey1.currentState!.validate()) {
                    submitaction(
                      textbox1controller.text,
                      textbox2controller.text,
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      );
    },
  );
}
