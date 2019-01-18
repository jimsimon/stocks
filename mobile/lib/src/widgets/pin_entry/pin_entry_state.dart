import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile/src/widgets/pin_entry/pin_entry.dart';
import 'package:mobile/src/widgets/pin_entry/pin_entry_presenter.dart';
import 'package:mobile/src/widgets/pin_entry/pin_entry_typedefs.dart';

class PinEntryState extends State<PinEntry> {
  final String title;
  final int pinSize;
  final OnCodeEntered onCodeEntered;
  List<int> digitsEntered = [];

  PinEntryState(this.title, this.pinSize, this.onCodeEntered);

  @override
  Widget build(BuildContext context) {
    return PinEntryPresenter(
      onBackspacePressed: onBackspacePressed,
      pinSize: pinSize,
      onDigitPressed: onDigitPressed,
      title: title,
      numberOfDigitsEntered: digitsEntered.length,
    );
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

  void onBackspacePressed() {
    setState(() {
      if (digitsEntered.isNotEmpty) {
        digitsEntered.removeLast();
      }
    });
  }
}
