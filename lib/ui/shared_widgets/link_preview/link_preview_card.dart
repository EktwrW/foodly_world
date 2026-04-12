import 'package:any_link_preview/any_link_preview.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/ui/theme/foodly_text_styles.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:url_launcher/url_launcher.dart';

/// Extracts the first URL found in [text], or `null` if none.
String? extractFirstUrl(String text) {
  final regex = RegExp(
    r'https?://[^\s<>\)\]\}]+',
    caseSensitive: false,
  );
  final match = regex.firstMatch(text);
  return match?.group(0);
}

/// A card that fetches and displays Open-Graph metadata for a URL.
///
/// Shows the page title, description, image, and domain.
/// Tapping opens the URL in the external browser.
class LinkPreviewCard extends StatefulWidget {
  final String url;

  /// Compact mode shows a smaller preview (for inside the create dialog).
  final bool compact;

  const LinkPreviewCard({
    super.key,
    required this.url,
    this.compact = false,
  });

  @override
  State<LinkPreviewCard> createState() => _LinkPreviewCardState();
}

class _LinkPreviewCardState extends State<LinkPreviewCard> {
  Metadata? _metadata;
  bool _loading = true;
  bool _error = false;

  @override
  void initState() {
    super.initState();
    _fetchMetadata();
  }

  @override
  void didUpdateWidget(covariant LinkPreviewCard old) {
    super.didUpdateWidget(old);
    if (old.url != widget.url) _fetchMetadata();
  }

  Future<void> _fetchMetadata() async {
    setState(() {
      _loading = true;
      _error = false;
    });

    try {
      final meta = await AnyLinkPreview.getMetadata(link: widget.url);
      if (mounted) {
        setState(() {
          _metadata = meta;
          _loading = false;
          _error = meta == null;
        });
      }
    } catch (_) {
      if (mounted) setState(() { _loading = false; _error = true; });
    }
  }

  String get _domain {
    final uri = Uri.tryParse(widget.url);
    return uri?.host.replaceFirst('www.', '') ?? widget.url;
  }

  Future<void> _open() async {
    final uri = Uri.tryParse(widget.url);
    if (uri != null && await canLaunchUrl(uri)) {
      launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Container(
        height: widget.compact ? 56 : 80,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: SizedBox.square(
            dimension: 20,
            child: CircularProgressIndicator.adaptive(strokeWidth: 2),
          ),
        ),
      );
    }

    if (_error || _metadata == null) return _buildMinimalPreview();

    return _buildRichPreview();
  }

  /// Fallback when OG metadata can't be fetched — just domain + icon.
  Widget _buildMinimalPreview() {
    return InkWell(
      onTap: _open,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            Icon(Icons.link_rounded, size: 20, color: FoodlyThemes.primaryFoodly.withValues(alpha: 0.7)),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                _domain,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: FoodlyTextStyles.caption.copyWith(color: FoodlyThemes.primaryFoodly),
              ),
            ),
            Icon(Icons.open_in_new, size: 16, color: Colors.grey.shade400),
          ],
        ),
      ),
    );
  }

  /// Full preview with image, title, description, and domain.
  Widget _buildRichPreview() {
    final meta = _metadata!;
    final hasImage = meta.image != null && meta.image!.isNotEmpty;
    final title = meta.title ?? _domain;
    final desc = meta.desc;

    return InkWell(
      onTap: _open,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: widget.compact ? _compactLayout(hasImage, title, desc) : _fullLayout(hasImage, title, desc),
      ),
    );
  }

  Widget _compactLayout(bool hasImage, String title, String? desc) {
    return Row(
      children: [
        if (hasImage)
          SizedBox(
            width: 60,
            height: 60,
            child: CachedNetworkImage(
              imageUrl: _metadata!.image!,
              fit: BoxFit.cover,
              errorWidget: (_, __, ___) => const Icon(Icons.link, size: 24),
            ),
          ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: FoodlyTextStyles.captionBold),
                const SizedBox(height: 2),
                Text(_domain, maxLines: 1, overflow: TextOverflow.ellipsis,
                    style: FoodlyTextStyles.caption.copyWith(color: Colors.grey.shade500, fontSize: 11)),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Icon(Icons.open_in_new, size: 14, color: Colors.grey.shade400),
        ),
      ],
    );
  }

  Widget _fullLayout(bool hasImage, String title, String? desc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (hasImage)
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 160),
            child: SizedBox(
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: _metadata!.image!,
                fit: BoxFit.cover,
                errorWidget: (_, __, ___) => const SizedBox.shrink(),
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, maxLines: 2, overflow: TextOverflow.ellipsis, style: FoodlyTextStyles.labelBold),
              if (desc != null && desc.isNotEmpty) ...[
                const SizedBox(height: 4),
                Text(desc, maxLines: 2, overflow: TextOverflow.ellipsis,
                    style: FoodlyTextStyles.caption.copyWith(color: Colors.black54)),
              ],
              const SizedBox(height: 6),
              Row(
                children: [
                  Icon(Icons.language, size: 14, color: Colors.grey.shade500),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(_domain, maxLines: 1, overflow: TextOverflow.ellipsis,
                        style: FoodlyTextStyles.caption.copyWith(color: Colors.grey.shade500, fontSize: 11)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
