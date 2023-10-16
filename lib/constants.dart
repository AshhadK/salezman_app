import 'dart:ui';

import 'package:flutter/material.dart';

const lightseagreen = Color(0xFFF20b2aa);
const darkseagreen = Color.fromARGB(255, 35, 104, 108);
const black = Colors.black;
const white = Colors.white;
const grey = Color.fromARGB(255, 204, 203, 203);

class Constants {
  static const splashHeading = TextStyle(
      color: lightseagreen, fontSize: 40.0, fontWeight: FontWeight.w900);
  static const btnText = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: white,
  );
  static const normalHeading = TextStyle(
      color: Color.fromARGB(255, 119, 117, 117),
      fontSize: 16.0,
      fontWeight: FontWeight.w500);
  static const italicHeading = TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 16.0,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w500);
  static const normalMainHeading = TextStyle(
      color: darkseagreen,
      fontStyle: FontStyle.italic,
      fontSize: 18.0,
      fontWeight: FontWeight.w600);
  static const customBarHeading =
      TextStyle(color: white, fontSize: 18.0, fontWeight: FontWeight.w600);
}
