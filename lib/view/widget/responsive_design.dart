import 'package:flutter/material.dart';

class Responsive {
  static const double referenceHeight = 812;
  static const double referenceWidth = 375;

  static double height(BuildContext context, double designHeight) {
    final screenHeight = MediaQuery.of(context).size.height;
    return designHeight * screenHeight / referenceHeight;
  }

  static double width(BuildContext context, double designWidth) {
    final screenWidth = MediaQuery.of(context).size.width;
    return designWidth * screenWidth / referenceWidth;
  }
}
