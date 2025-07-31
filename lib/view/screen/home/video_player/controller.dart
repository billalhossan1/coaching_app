import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerControllerX extends GetxController {
  late VideoPlayerController videoController;
  RxBool isPlaying = false.obs;
  RxDouble volume = 1.0.obs;
  RxDouble playbackPosition = 0.0.obs;

  // Add a constructor to accept a URL.
  final String videoUrl;

  VideoPlayerControllerX({required this.videoUrl});

  @override
  void onInit() {
    super.onInit();
    _initializePlayer();
  }

  void _initializePlayer() {
    videoController = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
      ..initialize().then((_) {
        update();
      });
  }

  void playPause() {
    if (isPlaying.value) {
      videoController.pause();
    } else {
      videoController.play();
    }
    isPlaying.value = !isPlaying.value;
  }

  void toggleVolume() {
    volume.value = volume.value == 0.0 ? 1.0 : 0.0;
    videoController.setVolume(volume.value);
  }

  void seekToPosition(double position) {
    videoController.seekTo(Duration(seconds: position.toInt()));
    playbackPosition.value = position;
  }

  @override
  void onClose() {
    videoController.dispose();
    super.onClose();
  }
}