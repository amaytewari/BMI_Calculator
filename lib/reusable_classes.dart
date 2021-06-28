import 'package:flutter/material.dart';
import 'constants.dart';


class ExpandedContainer extends StatelessWidget {
  ExpandedContainer(this.colour, this.containerInput);

  final Color colour;
  final Widget containerInput;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
        child: containerInput,
      );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData buttonIcon;
  final Function onPressedMine;

  RoundIconButton(this.buttonIcon, this.onPressedMine);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(buttonIcon),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      onPressed: onPressedMine,
      elevation: 6.0,
    );
  }
}


class BottomButton extends StatelessWidget {

  final String message;
  final Function onTapFunction;

  BottomButton(this.message, this.onTapFunction);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 7.0),
        child: Text(message,
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        )),
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10.0),
        height: heightBottomBar,
        width: double.infinity,
      ),
    );
  }
}
