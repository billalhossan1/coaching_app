import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvgImage extends StatelessWidget {
  final String imagePath;
  final double height;
  final double width;
  final bool isColorWhite;
  final Color? color;
  const CustomSvgImage({super.key, required this.imagePath, this.height=30, this.width=30, this.isColorWhite=false, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imagePath,
      width: width,
      height: height,
      color: color?? null,
      // color: isColorWhite? Color(0xFFE7E6E4) : Color(0xFFC4A862),
    );
  }
}
