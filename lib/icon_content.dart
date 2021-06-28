import 'package:flutter/material.dart';
import 'constants.dart';

class IconWidget extends StatelessWidget {
  final IconData iconType;
  final String gender;

  IconWidget([this.iconType, this.gender]);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconType,
          size: 80.0,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(gender,
            style: styleOfText)
      ],
    );
  }
}