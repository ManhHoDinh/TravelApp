import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/color_palatte.dart';
import 'package:travel_app/core/helpers/local_storage_helper.dart';
import 'package:travel_app/presentations/screens/splash.dart';
import 'package:travel_app/routes.dart';
// ignore: depend_on_referenced_packages
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await LocalStorageHelper.initLocalStorageHelper();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: ThemeData(
        primaryColor: ColorPalette.primaryColor,
        scaffoldBackgroundColor: ColorPalette.backgroundScaffoldColor,
      ),
      home: const SplashScreen(),
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
