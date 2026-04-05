part of '../feed_multi_image_view/feed_multi_image_view.dart';

class ImageViewer extends StatelessWidget {
  final List<String> imageUrls;
  const ImageViewer({
    super.key,
    required this.imageUrls,
  });

  /// Opens the image viewer overlay from anywhere in the app.
  static void open(BuildContext context, List<String> imageUrls) {
    if (imageUrls.isEmpty) return;
    final ctx = rootNavigatorKey.currentContext ?? context;
    Navigator.push(
      ctx,
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        barrierColor: Colors.transparent,
        pageBuilder: (_, __, ___) => ImageViewer(imageUrls: imageUrls),
        transitionsBuilder: (_, animation, __, child) => FadeTransition(opacity: animation, child: child),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Frosted glass backdrop: blur the page behind + tinted overlay
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: Container(
              color: Colors.black.withValues(alpha: 0.45),
            ),
          ),
          // Content
          SafeArea(
            child: Column(
              children: [
                // Close button
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: IconButton.styleFrom(backgroundColor: Colors.white.withValues(alpha: 0.3)),
                    icon: const Icon(Icons.close, color: Colors.white, size: 24),
                  ).paddingAll(4),
                ),
                // Image slideshow
                Expanded(
                  child: ImageSlideshow(
                    indicatorColor: Colors.white,
                    indicatorBackgroundColor: Colors.white.withValues(alpha: .3),
                    indicatorPadding: 12,
                    isLoop: imageUrls.length > 1,
                    children: imageUrls
                        .map(
                          (url) => PostImageWidget(
                            url,
                            fit: BoxFit.contain,
                            isPost: true,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
