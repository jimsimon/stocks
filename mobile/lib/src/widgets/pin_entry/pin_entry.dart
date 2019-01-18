import 'package:flutter/material.dart';
import 'package:mobile/src/widgets/pin_entry/pin_entry_state.dart';
import 'package:mobile/src/widgets/pin_entry/pin_entry_typedefs.dart';

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