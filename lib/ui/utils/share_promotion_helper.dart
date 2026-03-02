import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:foodly_world/data_models/promotions/promotion_dm.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

abstract class SharePromotionHelper {
  static Future<void> share(PromotionDM promo) async {
    final text = _buildShareText(promo);

    // Copy text to clipboard so apps that ignore the text param (Instagram)
    // still allow the user to paste it manually.
    await Clipboard.setData(ClipboardData(text: text));

    // YouTube or external link: share text with URL only
    if (promo.mediaFileIsExternalLink) {
      await Share.share('$text\n${promo.mediaLink}');
      return;
    }

    // Image from GCS: download to temp file and share with text
    if (promo.mediaFileIsImage && promo.promoMedia.isNotEmpty) {
      final mediaUrl = promo.promoMedia.first.mediaUrl;
      final file = await _downloadToTemp(mediaUrl, 'promo_${promo.uuid}.jpg');
      if (file != null) {
        await Share.shareXFiles([XFile(file.path)], text: text);
        file.deleteSync();
        return;
      }
    }

    // Video from GCS: download to temp file and share with text
    if (promo.mediaFileIsVideo && promo.promoMedia.isNotEmpty) {
      final mediaUrl = promo.promoMedia.first.mediaUrl;
      final file = await _downloadToTemp(mediaUrl, 'promo_${promo.uuid}.mp4');
      if (file != null) {
        await Share.shareXFiles([XFile(file.path)], text: text);
        file.deleteSync();
        return;
      }
    }

    // Fallback: text only
    await Share.share(text);
  }

  static String _buildShareText(PromotionDM promo) {
    final buffer = StringBuffer();
    buffer.writeln(promo.title);
    if (promo.subTitle.isNotEmpty) buffer.writeln(promo.subTitle);
    if (promo.description.isNotEmpty) buffer.writeln(promo.description);
    return buffer.toString().trimRight();
  }

  static Future<File?> _downloadToTemp(String url, String filename) async {
    try {
      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/$filename');
      await Dio().download(url, file.path);
      return file;
    } catch (_) {
      return null;
    }
  }
}
