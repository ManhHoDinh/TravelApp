import 'package:flutter/material.dart';
import 'package:travel_app/presentations/screens/intro.dart';
import 'package:travel_app/presentations/screens/main_screen.dart';
import 'package:travel_app/presentations/screens/splash.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  IntroScreen.routeName: (context) => IntroScreen(),
  MainScreen.routeName: (context) => MainScreen(),
};
