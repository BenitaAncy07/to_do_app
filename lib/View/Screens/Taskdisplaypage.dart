// ignore_for_file: deprecated_member_use

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Controller/Constants/UiConstants.dart';
import 'package:to_do_app/Controller/Providers/TaskProvider.dart';
import 'package:to_do_app/Controller/Utilities/Hexconversion.dart';
import 'package:to_do_app/Model/task.dart';
import 'package:to_do_app/View/Helpers/ColorContents.dart';
import 'package:to_do_app/View/Helpers/FontContents.dart';
import 'package:to_do_app/View/Helpers/IconContents.dart';
import 'package:to_do_app/View/Helpers/ImageContents.dart';

class Taskdisplaypage extends StatefulWidget {
  const Taskdisplaypage({super.key});

  @override
  State<Taskdisplaypage> createState() => _TaskdisplaypageState();
}

class _TaskdisplaypageState extends State<Taskdisplaypage> {
  TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Provider.of<TaskProvider>(context, listen: true).tasks.isEmpty
        ? Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(todoimg, height: 200),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    notaskfoundtext,
                    style: TextStyle(
                      fontSize: textsize6,
                      color:
                          AdaptiveTheme.of(context).mode ==
                                  AdaptiveThemeMode.light
                              ? black
                              : lighttheme,
                      fontFamily: headingfont,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
        : SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                // if (Provider.of<TaskProvider>(
                //   context,
                //   listen: true,
                // ).tasks.isNotEmpty)
                //   searchbarwidget(context),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.85,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount:
                        Provider.of<TaskProvider>(
                          context,
                          listen: true,
                        ).tasks.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width - 10,
                        child: Card(
                          color:
                              AdaptiveTheme.of(context).mode ==
                                      AdaptiveThemeMode.light
                                  ? lighttheme
                                  : darktheme,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  AdaptiveTheme.of(context).mode ==
                                          AdaptiveThemeMode.light
                                      ? lighttheme
                                      : darktheme,
                              borderRadius: BorderRadius.circular(12),
                              border: Border(
                                left: BorderSide(
                                  color: hexToColor(goldencolor),
                                  width: 5,
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: black.withOpacity(0.2),
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              bottom: 5,
                              top: 10,
                            ),
                            child: Row(
                              children: [
                                contentshowwidget(
                                  context,
                                  Provider.of<TaskProvider>(
                                    context,
                                    listen: true,
                                  ).tasks[index],
                                ),
                                buttonshowwidget(
                                  context,
                                  Provider.of<TaskProvider>(
                                    context,
                                    listen: true,
                                  ).tasks[index],
                                  index,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
  }

  // //============================searchbar widget================================
  // Widget searchbarwidget(BuildContext context) {
  //   return Padding(
  //     padding: EdgeInsets.all(5),
  //     child: Row(
  //       children: [
  //         Expanded(
  //           flex: 1,
  //           child: TextField(
  //             controller: searchcontroller,
  //             cursorColor: hexToColor(goldencolor),
  //             style: TextStyle(
  //               fontSize: textsize3,
  //               fontFamily: headingfont,
  //               color:
  //                   AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
  //                       ? black
  //                       : lighttheme,
  //             ),
  //             decoration: InputDecoration(
  //               hintText: searchhinttext,
  //               hintStyle: TextStyle(
  //                 fontSize: textsize3,
  //                 fontFamily: headingfont,
  //                 color:
  //                     AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
  //                         ? black.withOpacity(0.5)
  //                         : lighttheme.withOpacity(0.5),
  //               ),
  //               enabledBorder: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(8),
  //                 borderSide: BorderSide(
  //                   color: hexToColor(goldencolor),
  //                   width: 1.0,
  //                 ),
  //               ),
  //               focusedBorder: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(8),
  //                 borderSide: BorderSide(
  //                   color: hexToColor(goldencolor),
  //                   width: 1.0,
  //                 ),
  //               ),

  //               prefixIcon: Icon(
  //                 searchicon,
  //                 color: hexToColor(goldencolor),
  //                 size: iconsize2,
  //               ),
  //             ),
  //             onChanged: (value) {
  //               Provider.of<TaskProvider>(
  //                 context,
  //                 listen: false,
  //               ).searchTask(value);
  //             },
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  //===========================Content show widget========================
  Widget contentshowwidget(BuildContext context, Task item) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: TextStyle(
              fontSize: textsize4,
              color: item.isCompleted ? green : red,
              decoration:
                  item.isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
              decorationThickness: 2,
              decorationColor: item.isCompleted ? green : null,
              fontFamily: headingfont,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            item.description,
            style: TextStyle(
              fontSize: textsize3,
              color:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? black
                      : lighttheme,
              decoration:
                  item.isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
              decorationColor:
                  AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                      ? black
                      : lighttheme,
              decorationThickness: 1,
              fontFamily: headingfont,
            ),
          ),
        ],
      ),
    );
  }

  //========================button widget=======================
  buttonshowwidget(BuildContext context, Task item, int index) {
    return Column(
      children: [
        Image.asset(todoimg, height: 50, width: 50),
        Text(
          item.isCompleted ? completedtext : notcompletedtext,
          style: TextStyle(
            fontSize: textsize1,
            color: item.isCompleted ? green : red,
            fontFamily: headingfont,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),

        Row(
          children: [
            Tooltip(
              message: deletetext,
              textAlign: TextAlign.center,
              decoration: BoxDecoration(
                color:
                    AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                        ? lightgrey
                        : darkgrey,
                borderRadius: BorderRadius.circular(6),
              ),
              textStyle: TextStyle(
                fontSize: textsize1,
                color:
                    AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                        ? black
                        : lighttheme,
                fontFamily: headingfont,
                fontWeight: FontWeight.bold,
              ),

              child: IconButton(
                onPressed: () {
                  Provider.of<TaskProvider>(
                    context,
                    listen: false,
                  ).deleteTask(context, index);
                },
                icon: Icon(
                  Icons.delete_outline,
                  color: hexToColor(goldencolor),
                  size: iconsize1,
                ),
              ),
            ),
            Tooltip(
              message: updatestatustext,
              textAlign: TextAlign.center,
              decoration: BoxDecoration(
                color:
                    AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                        ? lightgrey
                        : darkgrey,
                borderRadius: BorderRadius.circular(6),
              ),
              textStyle: TextStyle(
                fontSize: textsize1,
                color:
                    AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                        ? black
                        : lighttheme,
                fontFamily: headingfont,
                fontWeight: FontWeight.bold,
              ),

              child: Transform.scale(
                scale: 0.6,
                child: Switch(
                  trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.selected)) {
                      return transparent;
                    }
                    return hexToColor(goldencolor);
                  }),
                  activeColor:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? lighttheme
                          : darktheme,
                  inactiveThumbColor:
                      AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
                          ? lighttheme
                          : darktheme,
                  activeTrackColor: hexToColor(goldencolor),
                  inactiveTrackColor: hexToColor(goldencolor).withOpacity(0.3),
                  value: item.isCompleted,
                  onChanged: (bool newValue) {
                    Provider.of<TaskProvider>(
                      context,
                      listen: false,
                    ).updateTaskstatus(index);
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
