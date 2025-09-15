import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Controller/Constants/UiConstants.dart';
import 'package:to_do_app/Controller/Providers/TaskProvider.dart';
import 'package:to_do_app/Controller/Utilities/Actions.dart';
import 'package:to_do_app/View/Helpers/ColorContents.dart';
import 'package:to_do_app/View/Helpers/IconContents.dart';
import 'package:to_do_app/View/Screens/Taskdisplaypage.dart';
import 'package:to_do_app/View/Typography/Appbar.dart';
import 'package:to_do_app/View/Typography/ButtonStyles.dart';

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
      body: PopScope(
        canPop: false, // Prevents the route from being popped automatically
        onPopInvokedWithResult: (didPop, result) {
          backbuttonaction(context, didPop);
        },
        child: Taskdisplaypage(),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          bottom:
              Provider.of<TaskProvider>(context, listen: true).tasks.length < 3
                  ? 20
                  : 0,
        ),
        child: floatingbutton(context, addtaskicon, addtaskbuttontext, (a) {
          Provider.of<TaskProvider>(context, listen: false).addTask(context);
        }),
      ),
    );
  }
}
