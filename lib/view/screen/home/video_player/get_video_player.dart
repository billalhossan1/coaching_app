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
    print("=================================================$videoUrl");
    Get.put(VideoPlayerControllerX(videoUrl: videoUrl));
    return Scaffold(
      body: GetBuilder<VideoPlayerControllerX>(builder: (controller) {
        if (!controller.videoController.value.isInitialized) {
          return Stack(
            children: [
              Center(child: CircularProgressIndicator()),
              Positioned(
                top: 40.h, // Adjust this to place the back button where you want
                left: 16.w, // Adjust this to place the back button
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          );
        }

        // Create a ChewieController
        ChewieController chewieController = ChewieController(
          videoPlayerController: controller.videoController,
          autoPlay: false,
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

        return Stack(
          children: [
            // Wrap the content in a SingleChildScrollView
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Directly use AspectRatio without Flexible
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
              ),
            ),
            Positioned(
              top: 40.h, // Adjust this for back button placement
              left: 16.w, // Adjust this for back button placement
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
