import 'package:flick_video_player/flick_video_player.dart';
import 'package:foodly_world/core/core_exports.dart';
import 'package:universal_io/io.dart';
import 'package:video_player/video_player.dart';

import 'package:youtube_player_embed/youtube_player_embed.dart';

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
  FlickManager? flickManager;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.file(
        File(widget.filePath),
      ),
      autoPlay: false,
    );
    if (mounted) setState(() {});
  }

  @override
  void didUpdateWidget(VideoPreview oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.filePath != widget.filePath) {
      flickManager?.dispose();
      flickManager = null;
      _initializePlayer();
    }
  }

  @override
  void dispose() {
    flickManager?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (flickManager == null) {
      return const Center(
        child: LoadingWidgetFoodlyIso(),
      );
    }

    return FlickVideoPlayer(
      flickManager: flickManager!,
      flickVideoWithControls: const FlickVideoWithControls(
        controls: CustomFlickPortraitControls(),
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
  late FlickManager flickManager;

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
                      size: 50,
                      color: Colors.white,
                      padding: const EdgeInsets.all(12),
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

class YouTubeVideoPlayer extends StatelessWidget {
  const YouTubeVideoPlayer({
    super.key,
    required this.url,
    this.videoTitle,
  });

  final String url;
  final String? videoTitle;

  String? _getVideoId(String url) {
    if (url.contains('youtube.com')) {
      return Uri.parse(url).queryParameters['v'];
    }
    if (url.contains('youtu.be')) {
      return url.split('/').last;
    }
    if (!url.contains('/') && !url.contains('?')) {
      return url;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final videoId = _getVideoId(url);

    if (videoId == null) {
      return Center(child: Text(S.current.invalidYoutubeUrl));
    }

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: YoutubePlayerEmbed(
          key: ValueKey(videoId),
          videoId: videoId,
          customVideoTitle: videoTitle ?? '',
          autoPlay: false,
          mute: true,
          aspectRatio: 16 / 9,
        ),
      ),
    );
  }
}
