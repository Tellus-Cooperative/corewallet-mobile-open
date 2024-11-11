import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'colors.dart';

List<String> walletEmojis = ["🤘", "🚗", "🏡"];

PinTheme defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: const TextStyle(
      color: mainBlack100, fontSize: 32, fontWeight: FontWeight.bold),
  decoration: BoxDecoration(
    color: mainBlack5,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: Colors.transparent),
  ),
);