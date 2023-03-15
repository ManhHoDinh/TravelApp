import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/helpers/text_styles.dart';
import '../../core/constants/color_palatte.dart';
import '../../core/helpers/assets_helper.dart';
import '../../core/helpers/image_helper.dart';

class AppBarContainerWidget extends StatelessWidget {
  AppBarContainerWidget(
      {super.key,
      child,
      title,
      implementLeading = false,
      implementMenu = false,
      titleString = ''}) {
    Child = child;
    Title = title;
    ImplementLeading = implementLeading;
    ImplementMenu = implementMenu;
    TitleString = titleString;
  }
  Widget? Child;
  Widget? Title;
  String? TitleString;
  bool? ImplementLeading;
  bool? ImplementMenu;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 4,
          child: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            centerTitle: true,
            toolbarHeight: MediaQuery.of(context).size.height / 4.2,
            backgroundColor: ColorPalette.backgroundScaffoldColor,
            title: Title ??
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (ImplementLeading != null && ImplementLeading == true)
                      Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Icon(
                            FontAwesomeIcons.arrowLeft,
                            color: Colors.black,
                          )),
                    Expanded(
                        child: Center(
                      child: Text(
                        TitleString ?? '',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                    )),
                    if (ImplementMenu != null && ImplementMenu == true)
                      Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Icon(
                            FontAwesomeIcons.barsStaggered,
                            color: Colors.black,
                          )),
                  ],
                ),
            flexibleSpace: Stack(children: [
              Container(
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(35)),
                    gradient: Gradients.defaultGradientBackground),
              ),
              Positioned(
                  child: ImageHelper.loadFromAsset(AssetHelper.icoOvalTop)),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: ImageHelper.loadFromAsset(AssetHelper.icoOvalBottom))
            ]),
          ),
        ),
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 4 - 40),
          padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
          child: Child ??
              Container(
                color: Colors.red,
              ),
        )
      ]),
    );
  }
}
