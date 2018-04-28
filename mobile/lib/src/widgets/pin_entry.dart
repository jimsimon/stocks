import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mobile/src/store/app_state.dart';
import 'package:redux/redux.dart';
import 'dart:async';

typedef bool OnCodeEntered(List<int> digits);
typedef void OnDigitPressed(int digit);

class PinEntry extends StatefulWidget {
  final String title;
  final int pinSize;
  final OnCodeEntered onCodeEntered;

  const PinEntry({Key key, this.title, this.pinSize, this.onCodeEntered})
      : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      new PinEntryState(title, pinSize, onCodeEntered);
}

class PinEntryState extends State<PinEntry> {
  final String title;
  final int pinSize;
  final OnCodeEntered onCodeEntered;
  List<int> digitsEntered = [];

  PinEntryState(this.title, this.pinSize, this.onCodeEntered);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, PinEntryViewModel>(converter: (store) {
      return new PinEntryViewModel(store, context);
    }, builder: (context, PinEntryViewModel viewModel) {
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
                          onPressed: () {
                            setState(() {
                              if (digitsEntered.isNotEmpty) {
                                digitsEntered.removeLast();
                              }
                            });
                          }))
                ])
          ],
        ),
      );
    });
  }

  List<Widget> buildIndicators() {
    var indicators = new List<Widget>.generate(digitsEntered.length, (int i) {
      return new Container(
        child: new Icon(Icons.radio_button_checked),
        margin: EdgeInsets.only(left: 12.0, right: 12.0),
      );
    });

    indicators.addAll(
        new List<Widget>.generate(pinSize - digitsEntered.length, (int i) {
      return new Container(
        child: new Icon(Icons.radio_button_unchecked),
        margin: EdgeInsets.only(left: 12.0, right: 12.0),
      );
    }));

    return indicators;
  }

  void onDigitPressed(int digit) {
    if (digitsEntered.length < pinSize) {
      setState(() {
        digitsEntered.add(digit);
      });
    }

    if (digitsEntered.length == pinSize) {
      bool verified = onCodeEntered(digitsEntered);
      if (!verified) {
        new Timer(new Duration(seconds: 1), () {
          setState(() {
            digitsEntered.clear();
          });
        });
      }
    }
  }
}

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

class PinEntryViewModel {
  final Store<AppState> store;
  final BuildContext context;

  PinEntryViewModel(this.store, this.context);
}
