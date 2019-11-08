import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Consts {
  static Size screenSize(BuildContext context) => MediaQuery.of(context).size;
  static double topPadding(BuildContext context) => MediaQuery.of(context).padding.top;
  static double bottomPadding(BuildContext context) => MediaQuery.of(context).padding.bottom;
}