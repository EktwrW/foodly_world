import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class AdaptiveImage extends StatelessWidget {
  final String imagePath;
  final BoxFit? fit;
  final Widget? loadingWdg;

  const AdaptiveImage({super.key, required this.imagePath, this.fit, this.loadingWdg});

  static const errorWdg = Icon(Icons.image_not_supported, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    final isUrl = Uri.tryParse(imagePath)?.hasAbsolutePath ?? false;
    final isNetwork = imagePath.startsWith('http') || imagePath.startsWith('https');

    if ((isNetwork && isUrl) || kIsWeb) {
      return CachedNetworkImage(
        imageUrl: imagePath,
        fit: fit ?? BoxFit.cover,
        placeholder: (context, url) => loadingWdg ?? const CircularProgressIndicator(),
        errorWidget: (context, url, error) => errorWdg,
      );
    } else {
      final imageFile = File(imagePath);
      return Image.file(
        imageFile,
        fit: fit ?? BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => errorWdg,
      );
    }
  }
}
