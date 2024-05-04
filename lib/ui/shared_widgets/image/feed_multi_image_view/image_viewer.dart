part of '../feed_multi_image_view/feed_multi_image_view.dart';

class ImageViewer extends StatelessWidget {
  final List<String> imageUrls;
  const ImageViewer({
    super.key,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.close,
                color: FoodlyThemes.primaryFoodly,
                size: 30,
              ),
            ),
            Expanded(
              child: ImageSlideshow(
                indicatorColor: FoodlyThemes.primaryFoodly,
                indicatorBackgroundColor:
                    FoodlyThemes.tertiaryFoodly.withOpacity(.25),
                isLoop: imageUrls.length > 1,
                children: imageUrls
                    .map(
                      (e) => ClipRect(
                        child: PostImageWidget(
                          e,
                          fit: BoxFit.contain,
                          isPost: true,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
