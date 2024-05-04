part of '../feed_multi_image_view/feed_multi_image_view.dart';

class MultipleImageView extends StatelessWidget {
  final List<String> imageUrls;
  final double radius;

  const MultipleImageView({
    super.key,
    required this.imageUrls,
    this.radius = 10,
  });

  BorderRadius get getTopLeftBottomLeftRadius => BorderRadius.only(
      topLeft: Radius.circular(radius), bottomLeft: Radius.circular(radius));

  BorderRadius get getTopRightBottomRightRadius => BorderRadius.only(
      topLeft: Radius.circular(radius), bottomLeft: Radius.circular(radius));

  BorderRadius get topRightRadius =>
      BorderRadius.only(topRight: Radius.circular(radius));

  BorderRadius get bottomRightRadius =>
      BorderRadius.only(bottomRight: Radius.circular(radius));

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: _contentRender(),
    );
  }

  List<Widget> _contentRender() {
    switch (imageUrls.length) {
      case 1:
        return _singleImageView();

      case 2:
        return _twoImageView();

      case 3:
        return _threeImageView();

      case 4:
        return _fourImageView();

      default:
        return _multipleImageView();
    }
  }

  List<Widget> _singleImageView() {
    return [
      MultiImageExpandedWdg(
        imageUrl: imageUrls.first,
        borderRadius: BorderRadius.circular(radius),
      ),
    ];
  }

  List<Widget> _twoImageView() {
    return [
      MultiImageExpandedWdg(
        imageUrl: imageUrls.first,
        borderRadius: getTopLeftBottomLeftRadius,
      ),
      const SizedBox(width: 5),
      MultiImageExpandedWdg(
        imageUrl: imageUrls.last,
        borderRadius: getTopRightBottomRightRadius,
      ),
    ];
  }

  List<Widget> _threeImageView() {
    return [
      MultiImageExpandedWdg(
        imageUrl: imageUrls[0],
        borderRadius: getTopLeftBottomLeftRadius,
      ),
      const SizedBox(width: 5),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MultiImageExpandedWdg(
                imageUrl: imageUrls[1], borderRadius: topRightRadius),
            const SizedBox(height: 5),
            MultiImageExpandedWdg(
                imageUrl: imageUrls[2], borderRadius: bottomRightRadius),
          ],
        ),
      ),
    ];
  }

  List<Widget> _fourImageView() {
    return [
      MultiImageExpandedWdg(
        imageUrl: imageUrls[0],
        flex: 2,
        borderRadius: getTopLeftBottomLeftRadius,
      ),
      const SizedBox(width: 5),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MultiImageExpandedWdg(
              imageUrl: imageUrls[1],
              borderRadius: topRightRadius,
            ),
            const SizedBox(height: 5),
            MultiImageExpandedWdg(imageUrl: imageUrls[2]),
            const SizedBox(height: 5),
            MultiImageExpandedWdg(
              imageUrl: imageUrls[3],
              borderRadius: bottomRightRadius,
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> _multipleImageView() {
    return [
      MultiImageExpandedWdg(
        imageUrl: imageUrls[0],
        flex: 2,
        borderRadius: getTopLeftBottomLeftRadius,
      ),
      const SizedBox(width: 5),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MultiImageExpandedWdg(
              imageUrl: imageUrls[1],
              borderRadius: topRightRadius,
            ),
            const SizedBox(height: 5),
            MultiImageExpandedWdg(imageUrl: imageUrls[2]),
            const SizedBox(height: 5),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: bottomRightRadius,
                    child: PostImageWidget(
                      imageUrls[3],
                      fit: BoxFit.cover,
                      isPost: true,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: bottomRightRadius),
                      child: Text(
                        '+${imageUrls.length - 4}',
                        style: FoodlyTextStyles.multiImageItemsLeft,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ];
  }
}

class MultiImageExpandedWdg extends StatelessWidget {
  final BorderRadiusGeometry borderRadius;
  final String imageUrl;
  final int flex;

  const MultiImageExpandedWdg({
    super.key,
    this.flex = 1,
    this.borderRadius = BorderRadius.zero,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: PostImageWidget(imageUrl, fit: BoxFit.cover, isPost: true),
      ),
    );
  }
}
