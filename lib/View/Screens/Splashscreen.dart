import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/Material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/Controller/Utilities/Actions.dart';
import 'package:to_do_app/View/Helpers/ColorContents.dart';
import 'package:to_do_app/View/Helpers/ImageContents.dart';
import 'package:to_do_app/View/Screens/MainScreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    initialcheck(context);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: transparent),
    );
  }

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logoWidth: 100,
      logo: Image.asset(splashlogo),
      backgroundColor:
          AdaptiveTheme.of(context).mode == AdaptiveThemeMode.light
              ? lighttheme
              : darktheme,
      showLoader: false,
      navigator: MainScreen(),
      durationInSeconds: 2,
    );
  }
}
