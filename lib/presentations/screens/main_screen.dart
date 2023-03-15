import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constants/color_palatte.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const String routeName = 'main_screen';
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(),
        // ignore: prefer_const_literals_to_create_immutables, prefer_const_constructors
        bottomNavigationBar: SalomonBottomBar(
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            currentIndex: _currentIndex,
            selectedItemColor: ColorPalette.primaryColor,
            unselectedItemColor: ColorPalette.primaryColor.withOpacity(0.2),
            items: [
              SalomonBottomBarItem(
                  icon: Icon(FontAwesomeIcons.house), title: Text('Home')),
              SalomonBottomBarItem(
                  icon: Icon(FontAwesomeIcons.solidHeart),
                  title: Text('Likes')),
              SalomonBottomBarItem(
                  icon: Icon(FontAwesomeIcons.briefcase),
                  title: Text('Booking')),
              SalomonBottomBarItem(
                  icon: Icon(FontAwesomeIcons.solidUser),
                  title: Text('Profile'))
            ]));
  }
}
