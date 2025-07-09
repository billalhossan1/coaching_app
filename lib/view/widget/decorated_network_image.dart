import 'package:flutter/material.dart';

class DecoratedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final Widget? child;
  final BoxDecoration? decoration;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Alignment alignment;
  final Widget? errorWidget;
  final Widget? loadingWidget;
  final Color? errorBackgroundColor;

  const DecoratedNetworkImage({
    super.key,
    required this.imageUrl,
    this.child,
    this.decoration,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.errorWidget,
    this.loadingWidget,
    this.errorBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: decoration ??
          BoxDecoration(
            color: errorBackgroundColor ?? Colors.grey[200],
            borderRadius: BorderRadius.circular(8.0),
          ),
      child: ClipRRect(
        borderRadius:
        decoration?.borderRadius?.resolve(TextDirection.ltr) ?? BorderRadius.zero,
        child: Stack(
          fit: StackFit.expand,
          alignment: alignment,
          children: [
            _buildImage(),
            if (child != null) child!,
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    if (imageUrl.isEmpty || !Uri.parse(imageUrl).isAbsolute) {
      return _buildErrorWidget('Invalid URL');
    }

    return Image.network(
      imageUrl,
      fit: fit,
      alignment: alignment,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return loadingWidget ??
            Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                    (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              ),
            );
      },
      errorBuilder: (context, error, stackTrace) {
        String errorMessage;
        if (error.toString().contains('HttpException') ||
            error.toString().contains('ClientException')) {
          errorMessage = 'Network error occurred';
        } else if (error.toString().contains('FormatException')) {
          errorMessage = 'Invalid image format';
        } else {
          errorMessage = 'Failed to load image';
        }
        return _buildErrorWidget(errorMessage);
      },
    );
  }

  Widget _buildErrorWidget(String errorMessage) {
    return errorWidget ??
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.broken_image,
                color: Colors.grey[600],
                size: 40.0,
              ),
              const SizedBox(height: 8.0),
              Text(
                errorMessage,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14.0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
  }
}