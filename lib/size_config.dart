import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWdith;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData!.size.height;
    screenWdith = _mediaQueryData!.size.width;
    blockSizeHorizontal = screenWdith! / 100;
    blockSizeVertical = screenHeight! / 100;
  }
}
