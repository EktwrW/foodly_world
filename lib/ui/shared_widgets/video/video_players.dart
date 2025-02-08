import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:foodly_world/core/core_exports.dart';
import 'package:foodly_world/generated/l10n.dart';
import 'package:foodly_world/ui/theme/foodly_themes.dart';
import 'package:universal_io/io.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_embed/controller/video_controller.dart';
import 'package:youtube_player_embed/enum/video_state.dart';
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

class YouTubeVideoPlayer extends StatefulWidget {
  const YouTubeVideoPlayer({
    super.key,
    required this.url,
    this.videoTitle,
  });

  final String url;
  final String? videoTitle;

  @override
  State<YouTubeVideoPlayer> createState() => _YouTubeVideoPlayerState();
}

class _YouTubeVideoPlayerState extends State<YouTubeVideoPlayer> {
  VideoController? videoController;
  late final String? videoId;

  @override
  void initState() {
    super.initState();
    videoId = _getVideoId(widget.url);
  }

  String? _getVideoId(String url) {
    // Para URLs en formato https://www.youtube.com/watch?v=XXXXXXXXXXX
    if (url.contains('youtube.com')) {
      return Uri.parse(url).queryParameters['v'];
    }
    // Para URLs en formato https://youtu.be/XXXXXXXXXXX
    if (url.contains('youtu.be')) {
      return url.split('/').last;
    }
    // Si la entrada ya es un ID
    if (!url.contains('/') && !url.contains('?')) {
      return url;
    }
    return null;
  }

  @override
  void dispose() {
    videoController?.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (videoId == null) {
      return Center(child: Text(S.current.invalidYoutubeUrl));
    }

    return YoutubePlayerEmbed(
      key: ValueKey(videoId),
      callBackVideoController: (controller) => videoController = controller,
      videoId: videoId!,
      customVideoTitle: widget.videoTitle ?? '',
      autoPlay: false,
      mute: true,
      aspectRatio: 16 / 9,
      onVideoEnd: () => debugPrint('video ended'),
      onVideoSeek: (currentTime) => debugPrint('Seeked to $currentTime seconds'),
      onVideoTimeUpdate: (currentTime) => debugPrint('Current time: $currentTime seconds'),
      onVideoStateChange: (state) => debugPrint(
        switch (state) {
          VideoState.playing => 'Video is playing',
          VideoState.paused => 'Video is paused',
          VideoState.muted => 'Video is muted',
          VideoState.unmuted => 'Video is unmuted',
          VideoState.fullscreen => 'Video is in fullscreen',
          VideoState.normalView => 'Video is in normal view',
        },
      ),
    );
  }
}
