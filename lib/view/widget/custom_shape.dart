import 'package:flutter/material.dart';

class CustomShape extends CustomClipper<Path> {
  final double leftBorder;
  final double rightBorder;
  CustomShape({required this.leftBorder, required this.rightBorder});
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - leftBorder);
    path.quadraticBezierTo(width / 2, height, width, height - rightBorder);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
