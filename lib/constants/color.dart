import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConstantsColor {
  static const Color appBarColor = Colors.black;
  static const Color textColor1 = Colors.white;
  static const Color textColor2 = Colors.purple;
  static const Color textColor3 = Colors.deepPurple;
  static const Color appColor = Color.fromRGBO(19, 19, 19, 1);
  static const Color appColor2 = Color.fromRGBO(30, 30, 30, 1);
  static const LinearGradient gradientColor = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.1, 0.9],
      colors: [Color.fromRGBO(0, 0, 0, 1), Color.fromRGBO(0, 0, 0, 1)]);
}
