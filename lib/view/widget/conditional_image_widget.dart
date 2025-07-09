import 'package:flutter/material.dart';

class ConditionalImageWidget extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final String baseUrl;

  ConditionalImageWidget({
    required this.imageUrl,
    required this.width,
    required this.height,
    required this.baseUrl,
  });

  @override
  Widget build(BuildContext context) {
    String finalImageUrl = imageUrl.startsWith('http') || imageUrl.startsWith('https')
        ? imageUrl
        : '$baseUrl$imageUrl';

    // Handle network image
    return Image.network(
      finalImageUrl,
      width: width,
      height: height,
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                  : null,
            ),
          );
        }
      },
      errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
        return Center(
          child: Icon(
            Icons.error,
            color: Colors.red,
            size: 40.0,
          ),
        );
      },
    );
  }
}
