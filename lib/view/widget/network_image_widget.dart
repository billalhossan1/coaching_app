import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final String? placeholder;
  final Widget? errorWidget;
  final Color shimmerBaseColor;
  final Color shimmerHighlightColor;
  final Duration fadeInDuration;
  final Duration fadeOutDuration;
  final VoidCallback? onTap;
  final bool enableMemoryCache;
  final bool enableDiskCache;

  const NetworkImageWidget({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.placeholder,
    this.errorWidget,
    this.shimmerBaseColor = const Color(0xFFE0E0E0),
    this.shimmerHighlightColor = const Color(0xFFF5F5F5),
    this.fadeInDuration = const Duration(milliseconds: 500),
    this.fadeOutDuration = const Duration(milliseconds: 300),
    this.onTap,
    this.enableMemoryCache = true,
    this.enableDiskCache = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageWidget = ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        memCacheWidth: width?.toInt(),
        memCacheHeight: height?.toInt(),
        fadeInDuration: fadeInDuration,
        fadeOutDuration: fadeOutDuration,
        useOldImageOnUrlChange: true,

        // Shimmer loading placeholder
        placeholder: (context, url) => _buildShimmerPlaceholder(),

        // Error widget with retry functionality
        errorWidget: (context, url, error) => _buildErrorWidget(context, error),

        // Image builder for additional customization
        imageBuilder: (context, imageProvider) => Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            image: DecorationImage(
              image: imageProvider,
              fit: fit,
            ),
          ),
        ),

        // Cache configuration
        cacheManager: enableDiskCache ? null : _createNoCacheManager(),
      ),
    );

    // Add tap functionality if provided
    if (onTap != null) {
      imageWidget = GestureDetector(
        onTap: onTap,
        child: imageWidget,
      );
    }

    return imageWidget;
  }

  // Build shimmer loading animation
  Widget _buildShimmerPlaceholder() {
    return Shimmer.fromColors(
      baseColor: shimmerBaseColor,
      highlightColor: shimmerHighlightColor,
      period: const Duration(milliseconds: 1500),
      child: Container(
        width: width == double.infinity ? double.infinity : width,
        height: height == double.infinity ? double.infinity : height,
        decoration: BoxDecoration(
          color: shimmerBaseColor,
          borderRadius: borderRadius,
        ),
        child: placeholder != null
            ? Center(
          child: Text(
            placeholder!,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        )
            : const SizedBox.shrink(),
      ),
    );
  }

  // Build error widget with retry and different error types
  Widget _buildErrorWidget(BuildContext context, dynamic error) {
    if (errorWidget != null) {
      return errorWidget!;
    }

    IconData errorIcon;
    String errorMessage;
    Color errorColor;

    // Handle different types of errors
    if (error.toString().contains('404')) {
      errorIcon = Icons.image_not_supported;
      errorMessage = 'Image not found';
      errorColor = Colors.orange;
    } else if (error.toString().contains('timeout') ||
        error.toString().contains('connection')) {
      errorIcon = Icons.wifi_off;
      errorMessage = 'Connection error';
      errorColor = Colors.red;
    } else if (error.toString().contains('format')) {
      errorIcon = Icons.broken_image;
      errorMessage = 'Invalid format';
      errorColor = Colors.purple;
    } else {
      errorIcon = Icons.error_outline;
      errorMessage = 'Failed to load';
      errorColor = Colors.grey;
    }

    return Container(
      width: width == double.infinity ? double.infinity : width,
      height: height == double.infinity ? double.infinity : height,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: borderRadius,
        border: Border.all(color: Colors.grey[300]!, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            errorIcon,
            color: errorColor,
            size: (height != null && height! < 100 && height != double.infinity) ? 24 : 48,
          ),
          const SizedBox(height: 8),
          Text(
            errorMessage,
            style: TextStyle(
              color: errorColor,
              fontSize: (height != null && height! < 100 && height != double.infinity) ? 10 : 12,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              // Force refresh by clearing cache and rebuilding
              CachedNetworkImage.evictFromCache(imageUrl);
              // Trigger rebuild - in real implementation, you might want to use
              // a callback or state management solution
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: errorColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: errorColor.withOpacity(0.3)),
              ),
              child: Text(
                'Retry',
                style: TextStyle(
                  color: errorColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to safely convert double to int for cache dimensions
  int? _getSafeIntValue(double? value) {
    if (value == null || value == double.infinity) {
      return null;
    }
    return value.toInt();
  }

  // Create cache manager that doesn't cache (for testing purposes)
  _createNoCacheManager() {
    // This is a placeholder - in real implementation, you'd create a custom cache manager
    // that doesn't store files on disk
    return null;
  }
}

