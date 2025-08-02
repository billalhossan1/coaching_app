// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:football_coaching_app/utils/AppColors/app_colors.dart';
// import 'package:football_coaching_app/utils/Texts/text_style.dart';
// import 'package:football_coaching_app/utils/app_error.dart';
// import 'package:video_player/video_player.dart';
//
// import '../../../widget/custom_circular_indicator.dart';
//
// class InteractiveVideoPlayer extends StatefulWidget {
//   final String videoUrl;
//   final String? text;
//   const InteractiveVideoPlayer({Key? key, required this.videoUrl, this.text}) : super(key: key);
//
//   @override
//   _InteractiveVideoPlayerState createState() => _InteractiveVideoPlayerState();
// }
//
// class _InteractiveVideoPlayerState extends State<InteractiveVideoPlayer> with TickerProviderStateMixin {
//   late VideoPlayerController _controller;
//   late AnimationController _controlsAnimationController;
//   late Animation<double> _controlsAnimation;
//
//   bool _isPlaying = false;
//   bool _showControls = true;
//   bool _isBuffering = false;
//   bool _isDragging = false;
//   bool _isFullScreen = false;
//
//   double _currentPosition = 0;
//   double _totalDuration = 1;
//   double _sliderValue = 0;
//
//   // Volume control
//   double _volume = 1.0;
//   bool _showVolumeSlider = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Initialize animation controller for smooth controls fade
//     _controlsAnimationController = AnimationController(
//       duration: Duration(milliseconds: 300),
//       vsync: this,
//     );
//     _controlsAnimation = CurvedAnimation(
//       parent: _controlsAnimationController,
//       curve: Curves.easeInOut,
//     );
//
//     _initializeVideoPlayer();
//   }
//
//   void _initializeVideoPlayer() {
//     _controller = VideoPlayerController.network(widget.videoUrl)
//       ..addListener(_videoListener)
//       ..initialize().then((_) {
//         if (mounted) {
//           setState(() {
//             _totalDuration = _controller.value.duration.inMilliseconds.toDouble();
//             if (_totalDuration <= 0) _totalDuration = 1;
//           });
//           _showControlsTemporarily();
//         }
//       })
//       ..setLooping(false)
//       ..setVolume(_volume);
//   }
//
//   void _videoListener() {
//     if (!_controller.value.isInitialized) return;
//
//     if (mounted) {
//       setState(() {
//         _currentPosition = _controller.value.position.inMilliseconds.toDouble();
//         _isBuffering = _controller.value.isBuffering;
//         _isPlaying = _controller.value.isPlaying;
//
//         // Update slider value only if not dragging
//         if (!_isDragging) {
//           _sliderValue = _currentPosition;
//         }
//
//         // Ensure totalDuration is never 0
//         if (_totalDuration <= 0) {
//           _totalDuration = _controller.value.duration.inMilliseconds.toDouble();
//           if (_totalDuration <= 0) _totalDuration = 1;
//         }
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     _controlsAnimationController.dispose();
//     _controller.removeListener(_videoListener);
//     _controller.dispose();
//     super.dispose();
//   }
//
//   void _togglePlayPause() {
//     setState(() {
//       if (_isPlaying) {
//         _controller.pause();
//       } else {
//         _controller.play();
//         _hideControlsAfterDelay();
//       }
//     });
//     _showControlsTemporarily();
//   }
//
//   void _seekTo(double value) {
//     final position = Duration(milliseconds: value.toInt());
//     _controller.seekTo(position);
//   }
//
//   void _onSliderChanged(double value) {
//     setState(() {
//       _sliderValue = value;
//       _isDragging = true;
//     });
//   }
//
//   void _onSliderChangeEnd(double value) {
//     _seekTo(value);
//     setState(() {
//       _isDragging = false;
//     });
//     if (_isPlaying) {
//       _hideControlsAfterDelay();
//     }
//   }
//
//   void _showControlsTemporarily() {
//     setState(() => _showControls = true);
//     _controlsAnimationController.forward();
//     _hideControlsAfterDelay();
//   }
//
//   void _hideControlsAfterDelay() {
//     Future.delayed(Duration(seconds: 3), () {
//       if (_isPlaying && mounted && !_isDragging && !_showVolumeSlider) {
//         _controlsAnimationController.reverse().then((_) {
//           if (mounted) setState(() => _showControls = false);
//         });
//       }
//     });
//   }
//
//   void _toggleControlsVisibility() {
//     if (_showControls) {
//       _controlsAnimationController.reverse().then((_) {
//         if (mounted) setState(() => _showControls = false);
//       });
//     } else {
//       _showControlsTemporarily();
//     }
//   }
//
//   void _toggleFullScreen() {
//     setState(() {
//       _isFullScreen = !_isFullScreen;
//     });
//
//     if (_isFullScreen) {
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
//       SystemChrome.setPreferredOrientations([
//         DeviceOrientation.landscapeLeft,
//         DeviceOrientation.landscapeRight,
//       ]);
//     } else {
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//       SystemChrome.setPreferredOrientations([
//         DeviceOrientation.portraitUp,
//       ]);
//     }
//
//     _showControlsTemporarily();
//   }
//
//   void _changeVolume(double value) {
//     setState(() {
//       _volume = value;
//       _controller.setVolume(_volume);
//     });
//   }
//
//   void _toggleVolumeSlider() {
//     setState(() {
//       _showVolumeSlider = !_showVolumeSlider;
//     });
//   }
//
//   // Skip forward/backward by 10 seconds
//   void _skipForward() {
//     final newPosition = _currentPosition + 10000; // 10 seconds in milliseconds
//     final clampedPosition = newPosition.clamp(0.0, _totalDuration);
//     _seekTo(clampedPosition);
//     _showControlsTemporarily();
//   }
//
//   void _skipBackward() {
//     final newPosition = _currentPosition - 10000; // 10 seconds in milliseconds
//     final clampedPosition = newPosition.clamp(0.0, _totalDuration);
//     _seekTo(clampedPosition);
//     _showControlsTemporarily();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     AppPrint.appError(widget.videoUrl);
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: Container(
//           width: double.infinity,
//           height: _isFullScreen ? double.infinity : null,
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     /// Video Player - Centered
//                     GestureDetector(
//                       onTap: _toggleControlsVisibility,
//                       onDoubleTap: _togglePlayPause,
//                       child: _controller.value.isInitialized
//                           ? Container(
//                         width: double.infinity,
//                         child: AspectRatio(
//                           aspectRatio: _controller.value.aspectRatio,
//                           child: VideoPlayer(_controller),
//                         ),
//                       ) : Container(
//                         height: 300,
//                         width: double.infinity,
//                         color: Colors.black,
//                         child: Center(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               CustomCircularIndicator(),
//                               SizedBox(height: 16),
//                               Text(
//                                 'Loading video...',
//                                 style: TextStyle(color: Colors.white70, fontSize: 16),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     /// Buffering Indicator
//                     if (_isBuffering && _controller.value.isInitialized)
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.black54,
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         padding: EdgeInsets.all(16),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             CustomCircularIndicator(),
//                             SizedBox(height: 8),
//                             Text(
//                               'Buffering...',
//                               style: TextStyle(color: Colors.white, fontSize: 14),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                     /// Skip Backward Button
//                     if (_showControls && _controller.value.isInitialized)
//                       Positioned(
//                         left: 60,
//                         child: FadeTransition(
//                           opacity: _controlsAnimation,
//                           child: GestureDetector(
//                             onTap: _skipBackward,
//                             child: Container(
//                               padding: EdgeInsets.all(8),
//                               decoration: BoxDecoration(
//                                 color: Colors.black54,
//                                 shape: BoxShape.circle,
//                               ),
//                               child: Icon(
//                                 Icons.replay_10,
//                                 size: 32,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//
//                     /// Play/Pause Button - Center
//                     if (_showControls && _controller.value.isInitialized)
//                       FadeTransition(
//                         opacity: _controlsAnimation,
//                         child: GestureDetector(
//                           onTap: _togglePlayPause,
//                           child: Container(
//                             padding: EdgeInsets.all(12),
//                             decoration: BoxDecoration(
//                               color: Colors.black54,
//                               shape: BoxShape.circle,
//                             ),
//                             child: Icon(
//                               _isPlaying ? Icons.pause : Icons.play_arrow,
//                               size: 48,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//
//                     /// Skip Forward Button
//                     if (_showControls && _controller.value.isInitialized)
//                       Positioned(
//                         right: 60,
//                         child: FadeTransition(
//                           opacity: _controlsAnimation,
//                           child: GestureDetector(
//                             onTap: _skipForward,
//                             child: Container(
//                               padding: EdgeInsets.all(8),
//                               decoration: BoxDecoration(
//                                 color: Colors.black54,
//                                 shape: BoxShape.circle,
//                               ),
//                               child: Icon(
//                                 Icons.forward_10,
//                                 size: 32,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//
//                     /// Bottom Controls
//                     if (_showControls && _controller.value.isInitialized)
//                       Positioned(
//                         bottom: 0,
//                         left: 0,
//                         right: 0,
//                         child: FadeTransition(
//                           opacity: _controlsAnimation,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(
//                                 begin: Alignment.bottomCenter,
//                                 end: Alignment.topCenter,
//                                 colors: [
//                                   Colors.black.withOpacity(0.8),
//                                   Colors.transparent,
//                                 ],
//                               ),
//                             ),
//                             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 /// Progress Slider
//                                 SliderTheme(
//                                   data: SliderTheme.of(context).copyWith(
//                                     activeTrackColor: Colors.red,
//                                     inactiveTrackColor: Colors.white24,
//                                     thumbColor: Colors.red,
//                                     thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6),
//                                     overlayColor: Colors.red.withOpacity(0.3),
//                                     trackHeight: 3,
//                                   ),
//                                   child: Slider(
//                                     value: _sliderValue.clamp(0.0, _totalDuration),
//                                     min: 0,
//                                     max: _totalDuration,
//                                     onChanged: _onSliderChanged,
//                                     onChangeEnd: _onSliderChangeEnd,
//                                   ),
//                                 ),
//
//                                 /// Bottom Row Controls
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     /// Time Display
//                                     Text(
//                                       '${_formatDuration(Duration(milliseconds: _currentPosition.toInt()))} / ${_formatDuration(Duration(milliseconds: _totalDuration.toInt()))}',
//                                       style: TextStyle(color: Colors.white, fontSize: 12),
//                                     ),
//
//                                     /// Control Buttons
//                                     Row(
//                                       children: [
//                                         /// Volume Control
//                                         GestureDetector(
//                                           onTap: _toggleVolumeSlider,
//                                           child: Container(
//                                             padding: EdgeInsets.all(8),
//                                             child: Icon(
//                                               _volume == 0
//                                                   ? Icons.volume_off
//                                                   : _volume < 0.5
//                                                   ? Icons.volume_down
//                                                   : Icons.volume_up,
//                                               color: Colors.white,
//                                               size: 20,
//                                             ),
//                                           ),
//                                         ),
//
//                                         /// Volume Slider
//                                         if (_showVolumeSlider)
//                                           Container(
//                                             width: 80,
//                                             child: SliderTheme(
//                                               data: SliderTheme.of(context).copyWith(
//                                                 activeTrackColor: Colors.white,
//                                                 inactiveTrackColor: Colors.white24,
//                                                 thumbColor: Colors.white,
//                                                 thumbShape: RoundSliderThumbShape(enabledThumbRadius: 4),
//                                                 trackHeight: 2,
//                                               ),
//                                               child: Slider(
//                                                 value: _volume,
//                                                 min: 0,
//                                                 max: 1,
//                                                 onChanged: _changeVolume,
//                                               ),
//                                             ),
//                                           ),
//
//                                         // SizedBox(width: 16),
//
//                                         ///=============== Fullscreen Button
//                                         // GestureDetector(
//                                         //   onTap: _toggleFullScreen,
//                                         //   child: Container(
//                                         //     padding: EdgeInsets.all(8),
//                                         //     child: Icon(
//                                         //       _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
//                                         //       color: Colors.white,
//                                         //       size: 20,
//                                         //     ),
//                                         //   ),
//                                         // ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//                 Text(widget.text!, style: TextStyles.regular14.copyWith(
//                   fontWeight: FontWeight.w500,
//                   color: AppColors.white600
//                 ), ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   String _formatDuration(Duration duration) {
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     final hours = duration.inHours;
//     final minutes = twoDigits(duration.inMinutes.remainder(60));
//     final seconds = twoDigits(duration.inSeconds.remainder(60));
//
//     if (hours > 0) {
//       return "${twoDigits(hours)}:$minutes:$seconds";
//     } else {
//       return "$minutes:$seconds";
//     }
//   }
// }

///=====================================


import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../../../../utils/AppColors/app_colors.dart';
import '../../../../utils/Texts/text_style.dart';
import '../../../widget/custom_circular_indicator.dart';

class InteractiveVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final String? text;
  const InteractiveVideoPlayer({Key? key, required this.videoUrl, this.text}) : super(key: key);

  @override
  _InteractiveVideoPlayerState createState() => _InteractiveVideoPlayerState();
}

class _InteractiveVideoPlayerState extends State<InteractiveVideoPlayer> with TickerProviderStateMixin {
  late VideoPlayerController _controller;
  late AnimationController _controlsAnimationController;
  late Animation<double> _controlsAnimation;

  // ValueNotifiers for specific updates to avoid full rebuilds
  late ValueNotifier<double> _positionNotifier;
  late ValueNotifier<bool> _playingNotifier;
  late ValueNotifier<bool> _bufferingNotifier;

  bool _showControls = true;
  bool _isDragging = false;
  bool _isFullScreen = false;

  double _totalDuration = 1;
  double _sliderValue = 0;

  // Volume control
  double _volume = 1.0;
  bool _showVolumeSlider = false;

  // Performance optimization
  Timer? _debounceTimer;
  Timer? _hideControlsTimer;
  String? _cachedDurationText;
  double _lastTotalDuration = 0;
  double _lastPosition = -1;

  @override
  void initState() {
    super.initState();

    // Initialize ValueNotifiers
    _positionNotifier = ValueNotifier<double>(0);
    _playingNotifier = ValueNotifier<bool>(false);
    _bufferingNotifier = ValueNotifier<bool>(false);

    // Initialize animation controller for smooth controls fade
    _controlsAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
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

  // Optimized video listener - only updates when values actually change
  void _videoListener() {
    if (!_controller.value.isInitialized || !mounted) return;

    final newPosition = _controller.value.position.inMilliseconds.toDouble();
    final newIsBuffering = _controller.value.isBuffering;
    final newIsPlaying = _controller.value.isPlaying;

    // Only update position every ~100ms to reduce excessive updates
    if ((_lastPosition - newPosition).abs() > 100 || _lastPosition == -1) {
      _lastPosition = newPosition;
      _positionNotifier.value = newPosition;

      // Update slider value only if not dragging
      if (!_isDragging) {
        _sliderValue = newPosition;
      }
    }

    // Update playing state only when changed
    if (_playingNotifier.value != newIsPlaying) {
      _playingNotifier.value = newIsPlaying;
    }

    // Update buffering state only when changed
    if (_bufferingNotifier.value != newIsBuffering) {
      _bufferingNotifier.value = newIsBuffering;
    }

    // Update duration if needed (rare)
    if (_totalDuration <= 0) {
      final duration = _controller.value.duration.inMilliseconds.toDouble();
      if (duration > 0) {
        setState(() {
          _totalDuration = duration;
        });
      }
    }
  }

  @override
  void dispose() {
    _hideControlsTimer?.cancel();
    _debounceTimer?.cancel();
    _controlsAnimationController.dispose();
    _controller.removeListener(_videoListener);
    _controller.dispose();
    _positionNotifier.dispose();
    _playingNotifier.dispose();
    _bufferingNotifier.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (_playingNotifier.value) {
      _controller.pause();
    } else {
      _controller.play();
      _hideControlsAfterDelay();
    }
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
    if (_playingNotifier.value) {
      _hideControlsAfterDelay();
    }
  }

  void _showControlsTemporarily() {
    setState(() => _showControls = true);
    _controlsAnimationController.forward();
    _hideControlsAfterDelay();
  }

  void _hideControlsAfterDelay() {
    _hideControlsTimer?.cancel();
    _hideControlsTimer = Timer(const Duration(seconds: 3), () {
      if (_playingNotifier.value && mounted && !_isDragging && !_showVolumeSlider) {
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
    final newPosition = _positionNotifier.value + 10000; // 10 seconds in milliseconds
    final clampedPosition = newPosition.clamp(0.0, _totalDuration);
    _seekTo(clampedPosition);
    _showControlsTemporarily();
  }

  void _skipBackward() {
    final newPosition = _positionNotifier.value - 10000; // 10 seconds in milliseconds
    final clampedPosition = newPosition.clamp(0.0, _totalDuration);
    _seekTo(clampedPosition);
    _showControlsTemporarily();
  }

  // Cache duration text to avoid repeated computations
  String _getCachedDurationText() {
    if (_totalDuration != _lastTotalDuration) {
      _lastTotalDuration = _totalDuration;
      _cachedDurationText = _formatDuration(Duration(milliseconds: _totalDuration.toInt()));
    }
    return _cachedDurationText ?? '';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: double.infinity,
          height: _isFullScreen ? double.infinity : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Video player with RepaintBoundary for performance
              RepaintBoundary(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    /// Video Player - Centered
                    _VideoPlayerWidget(
                      controller: _controller,
                      onTap: _toggleControlsVisibility,
                      onDoubleTap: _togglePlayPause,
                    ),

                    /// Buffering Indicator
                    ValueListenableBuilder<bool>(
                      valueListenable: _bufferingNotifier,
                      builder: (context, isBuffering, child) {
                        if (!isBuffering || !_controller.value.isInitialized) {
                          return const SizedBox.shrink();
                        }
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: const Column(
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
                        );
                      },
                    ),

                    /// Skip Backward Button
                    if (_showControls && _controller.value.isInitialized)
                      Positioned(
                        left: 60,
                        child: FadeTransition(
                          opacity: _controlsAnimation,
                          child: _VideoControlButton(
                            icon: Icons.replay_10,
                            onTap: _skipBackward,
                          ),
                        ),
                      ),

                    /// Play/Pause Button - Center
                    if (_showControls && _controller.value.isInitialized)
                      FadeTransition(
                        opacity: _controlsAnimation,
                        child: ValueListenableBuilder<bool>(
                          valueListenable: _playingNotifier,
                          builder: (context, isPlaying, child) {
                            return _VideoControlButton(
                              icon: isPlaying ? Icons.pause : Icons.play_arrow,
                              onTap: _togglePlayPause,
                              size: 48,
                            );
                          },
                        ),
                      ),

                    /// Skip Forward Button
                    if (_showControls && _controller.value.isInitialized)
                      Positioned(
                        right: 60,
                        child: FadeTransition(
                          opacity: _controlsAnimation,
                          child: _VideoControlButton(
                            icon: Icons.forward_10,
                            onTap: _skipForward,
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
                          child: _BottomControls(
                            sliderValue: _sliderValue,
                            totalDuration: _totalDuration,
                            onSliderChanged: _onSliderChanged,
                            onSliderChangeEnd: _onSliderChangeEnd,
                            positionNotifier: _positionNotifier,
                            cachedDurationText: _getCachedDurationText(),
                            volume: _volume,
                            showVolumeSlider: _showVolumeSlider,
                            onVolumeChanged: _changeVolume,
                            onVolumeToggle: _toggleVolumeSlider,
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // Video description text
              if (widget.text != null)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.text!,
                    style: TextStyles.regular14.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.white600,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// Optimized video player widget
class _VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;
  final VoidCallback onTap;
  final VoidCallback onDoubleTap;

  const _VideoPlayerWidget({
    required this.controller,
    required this.onTap,
    required this.onDoubleTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      behavior: HitTestBehavior.opaque,
      child: controller.value.isInitialized
          ? SizedBox(
        width: double.infinity,
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        ),
      )
          : Container(
        height: 300,
        width: double.infinity,
        color: Colors.black,
        child: const Center(
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
    );
  }
}

// Optimized control button widget
class _VideoControlButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final double size;

  const _VideoControlButton({
    required this.icon,
    required this.onTap,
    this.size = 32,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Colors.black54,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
    );
  }
}

// Optimized bottom controls widget
class _BottomControls extends StatelessWidget {
  final double sliderValue;
  final double totalDuration;
  final Function(double) onSliderChanged;
  final Function(double) onSliderChangeEnd;
  final ValueNotifier<double> positionNotifier;
  final String cachedDurationText;
  final double volume;
  final bool showVolumeSlider;
  final Function(double) onVolumeChanged;
  final VoidCallback onVolumeToggle;

  const _BottomControls({
    required this.sliderValue,
    required this.totalDuration,
    required this.onSliderChanged,
    required this.onSliderChangeEnd,
    required this.positionNotifier,
    required this.cachedDurationText,
    required this.volume,
    required this.showVolumeSlider,
    required this.onVolumeChanged,
    required this.onVolumeToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Progress Slider
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.red,
              inactiveTrackColor: Colors.white24,
              thumbColor: Colors.red,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
              overlayColor: Colors.red.withOpacity(0.3),
              trackHeight: 3,
            ),
            child: Slider(
              value: sliderValue.clamp(0.0, totalDuration),
              min: 0,
              max: totalDuration,
              onChanged: onSliderChanged,
              onChangeEnd: onSliderChangeEnd,
            ),
          ),

          /// Bottom Row Controls
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Time Display - Using ValueListenableBuilder for efficient updates
              ValueListenableBuilder<double>(
                valueListenable: positionNotifier,
                builder: (context, position, child) {
                  final currentTime = Duration(milliseconds: position.toInt());
                  return Text(
                    '${_formatDuration(currentTime)} / $cachedDurationText',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  );
                },
              ),

              /// Control Buttons
              Row(
                children: [
                  /// Volume Control
                  GestureDetector(
                    onTap: onVolumeToggle,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Icon(
                        volume == 0
                            ? Icons.volume_off
                            : volume < 0.5
                            ? Icons.volume_down
                            : Icons.volume_up,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),

                  /// Volume Slider
                  if (showVolumeSlider)
                    SizedBox(
                      width: 80,
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Colors.white24,
                          thumbColor: Colors.white,
                          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 4),
                          trackHeight: 2,
                        ),
                        child: Slider(
                          value: volume,
                          min: 0,
                          max: 1,
                          onChanged: onVolumeChanged,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
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