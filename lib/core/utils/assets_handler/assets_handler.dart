import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodly_world/core/enums/foodly_enums.dart';

class Asset extends StatelessWidget {
  final AssetData asset;
  final Color? color;
  final BoxFit? fit;
  final double? height;
  final double? width;

  const Asset(
    this.asset, {
    super.key,
    this.color,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    switch (asset.resourceType) {
      case ImageResourceType.vector:
        return SvgPicture.asset(
          asset.assetPath,
          colorFilter: ColorFilter.mode(color ?? Colors.transparent, BlendMode.srcIn),
          fit: fit ?? BoxFit.contain,
          height: height,
          width: width,
        );
      case ImageResourceType.raster:
      default:
        return Image.asset(
          asset.assetPath,
          color: asset.allowColorOverride ? color : null,
          fit: fit,
          height: height,
          width: width,
        );
    }
  }
}

class AssetData {
  final String assetName;
  final AssetType assetType;
  final ImageResourceType resourceType;
  final bool allowColorOverride;

  const AssetData(
    this.assetName,
    this.assetType, {
    this.resourceType = ImageResourceType.raster,
    this.allowColorOverride = true,
  });

  String get assetPath => assetType.pathMethod(assetName);
}
