import 'package:flutter/material.dart';

extension ThemeExt on ThemeData {
  Color get statusBarColor =>
      brightness == Brightness.dark ? cardColor : primaryColorDark;
}
