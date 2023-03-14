import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/color_palatte.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/assets_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/core/helpers/text_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/presentations/screens/main_screen.dart';
import 'package:travel_app/presentations/widgets/button_wigets.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});
  static String routeName = 'intro_screen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  String buttonText = 'Next';

  void onTapButton() {
    if (_pageController.page != 2) {
      _pageController.nextPage(
          duration: Duration(microseconds: 300), curve: Curves.linear);
    } else {
      Navigator.pushNamed(context, MainScreen.routeName);
    }
  }

  Widget _buildSlideView(String img, String title, String description,
      AlignmentGeometry alignmentGeometry) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            alignment: alignmentGeometry,
            child: ImageHelper.loadFromAsset(img,
                height: 400, fit: BoxFit.fitHeight)),
        Padding(
          padding: const EdgeInsets.only(
              top: kMediumPadding * 2, left: kMediumPadding),
          child: Text(
            title,
            style: TextStyles.h3.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: kMediumPadding,
              left: kMediumPadding,
              right: kMediumPadding * 3),
          child: Text(
            description,
            style: TextStyles.defaultStyle,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
            controller: _pageController,
            onPageChanged: (i) {
              if (i != 2) {
                setState(() {
                  buttonText = 'Next';
                });
              } else {
                setState(() {
                  buttonText = 'Get Started';
                });
              }
            },
            children: [
              _buildSlideView(
                  AssetHelper.intro1,
                  'Book a flight',
                  'Found a flight that matches your destination and schedule? Book it instantly.',
                  Alignment.topRight),
              _buildSlideView(
                  AssetHelper.intro2,
                  'Find a hotel room',
                  'Select the day, book your room. We give you the best price.',
                  Alignment.center),
              _buildSlideView(
                  AssetHelper.intro3,
                  'Enjoy your trip',
                  'Easy discovering new places and share these between your friends and travel together.',
                  Alignment.topLeft),
            ]),
        Positioned(
            left: kMediumPadding,
            right: kMediumPadding,
            bottom: kMediumPadding * 3,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: ExpandingDotsEffect(
                        activeDotColor: ColorPalette.yellowColor,
                        dotHeight: 12),
                  ),
                ),
                ButtonWidget(
                  onTapButton,
                  text: buttonText,
                )
              ],
            )),
      ]),
    );
  }
}
