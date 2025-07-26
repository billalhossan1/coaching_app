import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../../../widget/custom_circular_indicator.dart';

class InteractiveVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const InteractiveVideoPlayer({super.key, required this.videoUrl});

  @override
  _InteractiveVideoPlayerState createState() => _InteractiveVideoPlayerState();
}

class _InteractiveVideoPlayerState extends State<InteractiveVideoPlayer> with TickerProviderStateMixin {
  late VideoPlayerController _controller;
  late AnimationController _controlsAnimationController;
  late Animation<double> _controlsAnimation;

  bool _isPlaying = false;
  bool _showControls = true;
  bool _isBuffering = false;
  bool _isDragging = false;
  bool _isFullScreen = false;

  double _currentPosition = 0;
  double _totalDuration = 1;
  double _sliderValue = 0;

  // Volume control
  double _volume = 1.0;
  bool _showVolumeSlider = false;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller for smooth controls fade
    _controlsAnimationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _controlsAnimation = CurvedAnimation(
      parent: _controlsAnimationController,
      curve: Curves.easeInOut,
    );

    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() {
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..addListener(_videoListener)
      ..initialize().then((_) {
        if (mounted) {
          setState(() {
            _totalDuration = _controller.value.duration.inMilliseconds.toDouble();
            if (_totalDuration <= 0) _totalDuration = 1;
          });
          _showControlsTemporarily();
        }
      })
      ..setLooping(false)
      ..setVolume(_volume);
  }

  void _videoListener() {
    if (!_controller.value.isInitialized) return;

    if (mounted) {
      setState(() {
        _currentPosition = _controller.value.position.inMilliseconds.toDouble();
        _isBuffering = _controller.value.isBuffering;
        _isPlaying = _controller.value.isPlaying;

        // Update slider value only if not dragging
        if (!_isDragging) {
          _sliderValue = _currentPosition;
        }

        // Ensure totalDuration is never 0
        if (_totalDuration <= 0) {
          _totalDuration = _controller.value.duration.inMilliseconds.toDouble();
          if (_totalDuration <= 0) _totalDuration = 1;
        }
      });
    }
  }

  @override
  void dispose() {
    _controlsAnimationController.dispose();
    _controller.removeListener(_videoListener);
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
        _hideControlsAfterDelay();
      }
    });
    _showControlsTemporarily();
  }

  void _seekTo(double value) {
    final position = Duration(milliseconds: value.toInt());
    _controller.seekTo(position);
  }

  void _onSliderChanged(double value) {
    setState(() {
      _sliderValue = value;
      _isDragging = true;
    });
  }

  void _onSliderChangeEnd(double value) {
    _seekTo(value);
    setState(() {
      _isDragging = false;
    });
    if (_isPlaying) {
      _hideControlsAfterDelay();
    }
  }

  void _showControlsTemporarily() {
    setState(() => _showControls = true);
    _controlsAnimationController.forward();
    _hideControlsAfterDelay();
  }

  void _hideControlsAfterDelay() {
    Future.delayed(Duration(seconds: 3), () {
      if (_isPlaying && mounted && !_isDragging && !_showVolumeSlider) {
        _controlsAnimationController.reverse().then((_) {
          if (mounted) setState(() => _showControls = false);
        });
      }
    });
  }

  void _toggleControlsVisibility() {
    if (_showControls) {
      _controlsAnimationController.reverse().then((_) {
        if (mounted) setState(() => _showControls = false);
      });
    } else {
      _showControlsTemporarily();
    }
  }

  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });

    if (_isFullScreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
    }

    _showControlsTemporarily();
  }

  void _changeVolume(double value) {
    setState(() {
      _volume = value;
      _controller.setVolume(_volume);
    });
  }

  void _toggleVolumeSlider() {
    setState(() {
      _showVolumeSlider = !_showVolumeSlider;
    });
  }

  // Skip forward/backward by 10 seconds
  void _skipForward() {
    final newPosition = _currentPosition + 10000; // 10 seconds in milliseconds
    final clampedPosition = newPosition.clamp(0.0, _totalDuration);
    _seekTo(clampedPosition);
    _showControlsTemporarily();
  }

  void _skipBackward() {
    final newPosition = _currentPosition - 10000; // 10 seconds in milliseconds
    final clampedPosition = newPosition.clamp(0.0, _totalDuration);
    _seekTo(clampedPosition);
    _showControlsTemporarily();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: double.infinity,
          height: _isFullScreen ? double.infinity : null,
          child: Stack(
            alignment: Alignment.center,
            children: [
              /// Video Player - Centered
              GestureDetector(
                onTap: _toggleControlsVisibility,
                onDoubleTap: _togglePlayPause,
                child: _controller.value.isInitialized
                    ? Container(
                  width: double.infinity,
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                )
                    : Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.black,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomCircularIndicator(),
                        SizedBox(height: 16),
                        Text(
                          'Loading video...',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// Buffering Indicator
              if (_isBuffering && _controller.value.isInitialized)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomCircularIndicator(),
                      SizedBox(height: 8),
                      Text(
                        'Buffering...',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ),

              /// Skip Backward Button
              if (_showControls && _controller.value.isInitialized)
                Positioned(
                  left: 60,
                  child: FadeTransition(
                    opacity: _controlsAnimation,
                    child: GestureDetector(
                      onTap: _skipBackward,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.replay_10,
                          size: 32,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

              /// Play/Pause Button - Center
              if (_showControls && _controller.value.isInitialized)
                FadeTransition(
                  opacity: _controlsAnimation,
                  child: GestureDetector(
                    onTap: _togglePlayPause,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _isPlaying ? Icons.pause : Icons.play_arrow,
                        size: 48,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

              /// Skip Forward Button
              if (_showControls && _controller.value.isInitialized)
                Positioned(
                  right: 60,
                  child: FadeTransition(
                    opacity: _controlsAnimation,
                    child: GestureDetector(
                      onTap: _skipForward,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.forward_10,
                          size: 32,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

              /// Bottom Controls
              if (_showControls && _controller.value.isInitialized)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: FadeTransition(
                    opacity: _controlsAnimation,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.transparent,
                          ],
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          /// Progress Slider
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.red,
                              inactiveTrackColor: Colors.white24,
                              thumbColor: Colors.red,
                              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6),
                              overlayColor: Colors.red.withOpacity(0.3),
                              trackHeight: 3,
                            ),
                            child: Slider(
                              value: _sliderValue.clamp(0.0, _totalDuration),
                              min: 0,
                              max: _totalDuration,
                              onChanged: _onSliderChanged,
                              onChangeEnd: _onSliderChangeEnd,
                            ),
                          ),

                          /// Bottom Row Controls
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /// Time Display
                              Text(
                                '${_formatDuration(Duration(milliseconds: _currentPosition.toInt()))} / ${_formatDuration(Duration(milliseconds: _totalDuration.toInt()))}',
                                style: TextStyle(color: Colors.white, fontSize: 12),
                              ),

                              /// Control Buttons
                              Row(
                                children: [
                                  /// Volume Control
                                  GestureDetector(
                                    onTap: _toggleVolumeSlider,
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      child: Icon(
                                        _volume == 0
                                            ? Icons.volume_off
                                            : _volume < 0.5
                                            ? Icons.volume_down
                                            : Icons.volume_up,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),

                                  /// Volume Slider
                                  if (_showVolumeSlider)
                                    Container(
                                      width: 80,
                                      child: SliderTheme(
                                        data: SliderTheme.of(context).copyWith(
                                          activeTrackColor: Colors.white,
                                          inactiveTrackColor: Colors.white24,
                                          thumbColor: Colors.white,
                                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 4),
                                          trackHeight: 2,
                                        ),
                                        child: Slider(
                                          value: _volume,
                                          min: 0,
                                          max: 1,
                                          onChanged: _changeVolume,
                                        ),
                                      ),
                                    ),

                                  SizedBox(width: 16),

                                  /// Fullscreen Button
                                  GestureDetector(
                                    onTap: _toggleFullScreen,
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      child: Icon(
                                        _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = duration.inHours;
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    if (hours > 0) {
      return "${twoDigits(hours)}:$minutes:$seconds";
    } else {
      return "$minutes:$seconds";
    }
  }
}