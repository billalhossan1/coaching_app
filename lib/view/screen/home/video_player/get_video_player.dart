import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:chewie/chewie.dart';
import '../../../../utils/AppColors/app_colors.dart';
import '../../../../utils/Texts/text_style.dart';
import '../../../widget/size.dart';
import 'controller.dart' show VideoPlayerControllerX;

class VideoPlayerPage extends StatelessWidget {
  final String videoUrl;
  final String text;
  const VideoPlayerPage({super.key, required this.videoUrl, required this.text});

  @override
  Widget build(BuildContext context) {
    Get.put(VideoPlayerControllerX(videoUrl: videoUrl));
    return Scaffold(
      body: GetBuilder<VideoPlayerControllerX>(
        builder: (controller) {
          if (!controller.videoController.value.isInitialized) {
            return Center(child: CircularProgressIndicator());
          }
          // Create a ChewieController
          ChewieController chewieController = ChewieController(
            videoPlayerController: controller.videoController,
            autoPlay: true,
            looping: true,
            allowFullScreen: true,
            showControls: true,
            materialProgressColors: ChewieProgressColors(
              playedColor: Colors.blue,
              handleColor: Colors.blueAccent,
              backgroundColor: Colors.grey,
            ),
            cupertinoProgressColors: ChewieProgressColors(
              playedColor: Colors.blue,
              handleColor: Colors.blueAccent,
              backgroundColor: Colors.grey,
            ),
            allowMuting: true,

          );
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: controller.videoController.value.aspectRatio,
                child: Chewie(controller: chewieController),
              ),
              HeightGap(height: 20.h),
              // Video description text
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  text,
                  style: TextStyles.regular14.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.white600,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

}