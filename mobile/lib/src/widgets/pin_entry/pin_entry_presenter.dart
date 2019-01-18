import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/src/widgets/pin_entry/digit_button.dart';
import 'package:mobile/src/widgets/pin_entry/pin_entry_typedefs.dart';

class PinEntryPresenter extends StatelessWidget {
  final String title;
  final int pinSize;
  final int numberOfDigitsEntered;
  final OnBackspacePressed onBackspacePressed;
  final OnDigitPressed onDigitPressed;

  PinEntryPresenter({
    Key key,
    @required this.title,
    @required this.pinSize,
    @required this.numberOfDigitsEntered,
    @required this.onBackspacePressed,
    @required this.onDigitPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(bottom: 48.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(title,
                  textScaleFactor: 1.5,
                  style: Theme.of(context).textTheme.title)
              ])),
          new Container(
            child: new Row(
              children: buildIndicators(),
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            margin: EdgeInsets.only(bottom: 48.0),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new DigitButton(digit: 1, onDigitPressed: onDigitPressed),
              new DigitButton(digit: 2, onDigitPressed: onDigitPressed),
              new DigitButton(digit: 3, onDigitPressed: onDigitPressed),
            ]),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new DigitButton(digit: 4, onDigitPressed: onDigitPressed),
              new DigitButton(digit: 5, onDigitPressed: onDigitPressed),
              new DigitButton(digit: 6, onDigitPressed: onDigitPressed),
            ]),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new DigitButton(digit: 7, onDigitPressed: onDigitPressed),
              new DigitButton(digit: 8, onDigitPressed: onDigitPressed),
              new DigitButton(digit: 9, onDigitPressed: onDigitPressed),
            ]),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new DigitButton(digit: 0, onDigitPressed: onDigitPressed),
              new Container(
                child: new FlatButton(
                  child: new Icon(Icons.backspace),
                  onPressed: onBackspacePressed
                )
              )
            ])
        ],
      ),
    );
  }

  List<Widget> buildIndicators() {
    var indicators = new List<Widget>.generate(numberOfDigitsEntered, (int i) {
      return new Container(
        child: new Icon(Icons.radio_button_checked),
        margin: EdgeInsets.only(left: 12.0, right: 12.0),
      );
    });

    indicators.addAll(
      new List<Widget>.generate(pinSize - numberOfDigitsEntered, (int i) {
        return new Container(
          child: new Icon(Icons.radio_button_unchecked),
          margin: EdgeInsets.only(left: 12.0, right: 12.0),
        );
      }));

    return indicators;
  }
}