import 'package:flutter/material.dart';

class SizeApp{
  static double widthapp=420;
  static double padingapp=20;
  static double padingappaya=10;
}


double getResponsiveFontSize(
    BuildContext context, {
      required double iphoneSize,
      required double ipadMediumSize,
      required double ipadLargeSize,
    }) {
  double screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth < 600) {
    return iphoneSize;
  } else if (screenWidth < 900) {
    return ipadMediumSize;
  } else {
    return ipadLargeSize;
  }
}
