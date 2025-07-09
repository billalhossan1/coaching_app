import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final Border? border;
  final BorderRadius? borderRadius;
  final BoxShape boxShape;
  final Color? backgroundColor;
  final Widget? child;
  final ColorFilter? colorFilter;
  final BoxFit? fit;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool enableRetry;

  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
    this.border,
    this.borderRadius,
    this.boxShape = BoxShape.rectangle,
    this.backgroundColor,
    this.child,
    this.colorFilter,
    this.fit = BoxFit.cover,
    this.onTap,
    this.onLongPress,
    this.enableRetry = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) => _buildContainer(
          image: imageProvider,
        ),
        placeholder: (context, url) => _buildShimmerPlaceholder(),
        errorWidget: (context, url, error) => _buildErrorWidget(context),
      ),
    );
  }

  Widget _buildContainer({ImageProvider? image}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: border,
        borderRadius: borderRadius,
        shape: boxShape,
        color: backgroundColor,
        image: image != null
            ? DecorationImage(
          image: image,
          fit: fit ?? BoxFit.cover,
          colorFilter: colorFilter,
        )
            : null,
      ),
      child: child,
    );
  }

  Widget _buildShimmerPlaceholder() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.6),
      highlightColor: Colors.grey.withOpacity(0.3),
      child: _buildContainer(),
    );
  }

  Widget _buildErrorWidget(BuildContext context) {
    return _buildContainer(
      image: null,
    ).copyWith(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red),
            const SizedBox(height: 4),
            if (enableRetry)
              TextButton(
                onPressed: () {
                  (context as Element).markNeedsBuild();
                },
                child: const Text('Retry'),
              ),
          ],
        ),
      ),
    );
  }
}

extension on Widget {
  Widget copyWith({Widget? child}) {
    return child == null ? this : Stack(children: [this, child]);
  }
}

// CustomNetworkImage(
// imageUrl: 'https://example.com/image.jpg',
// height: 120,
// width: 120,
// borderRadius: BorderRadius.circular(12),
// fit: BoxFit.cover,
// onTap: () => print("Image tapped"),
// onLongPress: () => print("Image long-pressed"),
// ),
