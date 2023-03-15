import 'package:flutter/material.dart';
import 'package:travel_app/core/helpers/assets_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/presentations/widgets/app_container_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      child: Container(
        color: Colors.blue,
      ),
      title: Row(
        children: [
          Column(children: [
            Text(
              'Hi, James!',
              style: TextStyle(fontSize: 30),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                'Where are you going next?',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            )
          ]),
          Spacer(),
          Icon(FontAwesomeIcons.bell),
          Container(
              margin: EdgeInsets.only(left: 15),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.white),
              child: ImageHelper.loadFromAsset(AssetHelper.person,
                  fit: BoxFit.fitHeight))
        ],
      ),
    );
  }
}
