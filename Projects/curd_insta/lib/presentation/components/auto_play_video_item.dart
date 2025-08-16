import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AutoPlayVideoItem extends StatefulWidget {
  final String videoUrl;
  final double height;

  const AutoPlayVideoItem({
    super.key,
    required this.videoUrl,
    this.height = 400,
  });

  @override
  State<AutoPlayVideoItem> createState() => _AutoPlayVideoItemState();
}

class _AutoPlayVideoItemState extends State<AutoPlayVideoItem> {
  late VideoPlayerController _controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  void _playPauseBasedOnVisibility(double visibleFraction) {
    // Play when >70% visible, pause otherwise
    if (visibleFraction > 0.9 && !_controller.value.isPlaying) {
      _controller.play();
      setState(() => isPlaying = true);
    } else if (visibleFraction <= 0.9 && _controller.value.isPlaying) {
      _controller.pause();
      setState(() => isPlaying = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.videoUrl),
      onVisibilityChanged: (info) {
        _playPauseBasedOnVisibility(info.visibleFraction);
      },
      child: SizedBox(
        height: widget.height,
        width: double.infinity,
        child: _controller.value.isInitialized
            ? FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: _controller.value.size.width,
            height: _controller.value.size.height,
            child: VideoPlayer(_controller),
          ),
        )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
