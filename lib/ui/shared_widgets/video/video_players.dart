import 'package:cached_network_image/cached_network_image.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:foodly_world/core/core_exports.dart';
import 'package:universal_io/io.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPreview extends StatefulWidget {
  const VideoPreview({
    required this.filePath,
    super.key,
  });

  final String filePath;

  @override
  State<VideoPreview> createState() => _VideoPreviewState();
}

class _VideoPreviewState extends State<VideoPreview> {
  FlickManager? _flickManager;
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    // Pre-initialize the controller so FlickManager receives a ready controller.
    // This avoids "VideoPlayerController used after being disposed" races that
    // occur when the widget is torn down while FlickManager initializes internally.
    final controller = VideoPlayerController.file(File(widget.filePath));
    try {
      await controller.initialize();
    } catch (_) {
      controller.dispose();
      return;
    }

    if (_isDisposed || !mounted) {
      controller.dispose();
      return;
    }

    final previous = _flickManager;
    setState(() {
      _flickManager = FlickManager(videoPlayerController: controller, autoPlay: false);
    });
    previous?.dispose();
  }

  @override
  void didUpdateWidget(VideoPreview oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.filePath != widget.filePath) {
      final old = _flickManager;
      _flickManager = null;
      old?.dispose();
      _initializePlayer();
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    final manager = _flickManager;
    _flickManager = null;
    manager?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_flickManager == null) {
      return const Center(child: LoadingWidgetFoodlyIso());
    }

    return FlickVideoPlayer(
      flickManager: _flickManager!,
      flickVideoWithControls: const FlickVideoWithControls(
        controls: CustomFlickPortraitControls(iconSize: 16),
        playerLoadingFallback: Center(child: LoadingWidgetFoodlyIso(height: 46)),
      ),
    );
  }
}

class NetworkVideoPlayer extends StatefulWidget {
  const NetworkVideoPlayer({super.key, required this.url});

  final String url;

  @override
  State<NetworkVideoPlayer> createState() => _NetworkVideoPlayerState();
}

class _NetworkVideoPlayerState extends State<NetworkVideoPlayer> {
  late final FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.networkUrl(
        Uri.parse(widget.url),
      ),
    )..flickControlManager?.mute();
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlickVideoPlayer(
      flickManager: flickManager,
      flickVideoWithControls: const FlickVideoWithControls(
        controls: CustomFlickPortraitControls(),
        playerLoadingFallback: Center(child: CircularProgressIndicator.adaptive()),
      ),
    );
  }
}

class CustomFlickPortraitControls extends StatelessWidget {
  const CustomFlickPortraitControls({
    super.key,
    this.iconSize = 24,
    this.fontSize = 12,
  });

  final double iconSize;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Botón central de play/pause con fondo translúcido
        Positioned.fill(
          child: FlickShowControlsAction(
            child: FlickSeekVideoAction(
              child: Center(
                child: FlickVideoBuffer(
                  child: FlickAutoHideChild(
                    showIfVideoNotInitialized: false,
                    child: FlickPlayToggle(
                      size: 32,
                      color: Colors.white,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        // Barra de controles inferior
        Positioned.fill(
          child: FlickAutoHideChild(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Barra de progreso
                FlickVideoProgressBar(
                  flickProgressBarSettings: FlickProgressBarSettings(
                    handleRadius: 6,
                    height: 8,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    bufferedColor: Colors.white38,
                    playedColor: FoodlyThemes.primaryFoodly,
                    handleColor: FoodlyThemes.primaryFoodly,
                  ),
                ),
                // Controles inferiores
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  color: Colors.black.withValues(alpha: 0.4),
                  child: Row(
                    children: [
                      FlickPlayToggle(size: iconSize, color: Colors.white),
                      const SizedBox(width: 8),
                      FlickCurrentPosition(
                        fontSize: fontSize,
                        color: Colors.white,
                      ),
                      Text(
                        ' / ',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: fontSize,
                        ),
                      ),
                      FlickTotalDuration(
                        fontSize: fontSize,
                        color: Colors.white,
                      ),
                      const Spacer(),
                      FlickSoundToggle(size: iconSize, color: Colors.white),
                      const SizedBox(width: 8),
                      FlickFullScreenToggle(size: iconSize, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Plays a YouTube video inline using [YoutubePlayerController].
/// On Flutter Web (unsupported by the package), falls back to
/// thumbnail + external launch via url_launcher.
///
/// Exposes [extractVideoId] as a static helper so callers (e.g. the
/// home carousel) can build thumbnail previews without instantiating
/// a full player.
class YouTubeVideoPlayer extends StatefulWidget {
  const YouTubeVideoPlayer({
    super.key,
    required this.url,
    this.videoTitle,
  });

  final String url;
  final String? videoTitle;

  /// Extracts the YouTube video ID from any supported URL format,
  /// including youtube.com/watch?v=, youtu.be/, and bare IDs.
  static String? extractVideoId(String url) => YoutubePlayer.convertUrlToId(url);

  @override
  State<YouTubeVideoPlayer> createState() => _YouTubeVideoPlayerState();
}

class _YouTubeVideoPlayerState extends State<YouTubeVideoPlayer> {
  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
    final videoId = YouTubeVideoPlayer.extractVideoId(widget.url);
    if (videoId != null && !kIsWeb) {
      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(
          autoPlay: false,
          captionLanguage: di<AuthSessionService>().lang,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _launchExternal() async {
    final uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final videoId = YouTubeVideoPlayer.extractVideoId(widget.url);

    if (videoId == null) {
      return Center(child: Text(S.current.invalidYoutubeUrl));
    }

    // Web fallback: thumbnail + tap to open externally
    if (kIsWeb || _controller == null) {
      return _YoutubeThumbnail(videoId: videoId, onTap: _launchExternal);
    }

    return YoutubePlayer(
      controller: _controller!,
      showVideoProgressIndicator: true,
      progressIndicatorColor: FoodlyThemes.primaryFoodly,
      progressColors: const ProgressBarColors(
        playedColor: FoodlyThemes.primaryFoodly,
        handleColor: FoodlyThemes.primaryFoodly,
      ),
    );
  }
}

/// Static YouTube thumbnail with a play button overlay.
/// Used by [YouTubeVideoPlayer] on web and by the home carousel preview.
class YoutubeThumbnailPreview extends StatelessWidget {
  final String url;
  final VoidCallback? onTap;

  const YoutubeThumbnailPreview({super.key, required this.url, this.onTap});

  @override
  Widget build(BuildContext context) {
    final videoId = YouTubeVideoPlayer.extractVideoId(url);
    if (videoId == null) return const SizedBox.shrink();
    return _YoutubeThumbnail(videoId: videoId, onTap: onTap);
  }
}

class _YoutubeThumbnail extends StatelessWidget {
  final String videoId;
  final VoidCallback? onTap;

  const _YoutubeThumbnail({required this.videoId, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: 'https://img.youtube.com/vi/$videoId/hqdefault.jpg',
            fit: BoxFit.cover,
            errorWidget: (_, __, ___) => const ColoredBox(
              color: Colors.black87,
              child: Center(child: Icon(Icons.play_circle_outline, color: Colors.white, size: 48)),
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.55),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 36),
            ),
          ),
          const Positioned(
            bottom: 8,
            right: 8,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xFFFF0000),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                child: Text(
                  'YouTube',
                  style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
