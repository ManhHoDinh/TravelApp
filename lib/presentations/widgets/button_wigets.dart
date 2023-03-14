import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/color_palatte.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/text_styles.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget(VoidCallback onTap,
      {String text = '', Color color = Colors.yellowAccent, super.key}) {
    _text = text;
    _voidCallback = onTap;
    _color = color;
  }
  String _text = '';
  VoidCallback _voidCallback = () {};
  Color _color = Colors.yellowAccent;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _voidCallback,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kMediumPadding * 2, vertical: kMediumPadding / 1.5),
          child: Text(
            _text,
            style: TextStyles.defaultStyle.bold.copyWith(color: Colors.white),
          ),
        ),
        decoration:
            // ignore: prefer_const_constructors
            BoxDecoration(
                borderRadius:
                    const BorderRadius.all(Radius.circular(kMediumPadding)),
                gradient: Gradients.defaultGradientBackground),
      ),
    );
  }
}
