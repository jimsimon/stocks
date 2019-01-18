import 'package:flutter/material.dart';
import 'package:mobile/src/widgets/pin_entry/pin_entry_typedefs.dart';

class DigitButton extends StatelessWidget {
  final int digit;
  final OnDigitPressed onDigitPressed;

  const DigitButton({Key key, this.digit, this.onDigitPressed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var width, height;
    if (mediaQuery.orientation == Orientation.portrait) {
      width = mediaQuery.size.width / 3;
      height = (mediaQuery.size.height - 96.0) / 5;
    } else {
      width = mediaQuery.size.height / 3;
      height = (mediaQuery.size.width - 96.0) / 5;
    }

    return new Container(
      height: height,
      width: width,
      child: new FlatButton(
        child: new Text(digit.toString(), textScaleFactor: 2.0),
        onPressed: () => onDigitPressed(digit),
      ),
    );
  }
}