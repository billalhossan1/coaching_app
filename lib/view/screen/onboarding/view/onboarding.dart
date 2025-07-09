import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/AppImg/app_img.dart';
import '../../../../utils/Texts/text_style.dart';
import '../controller/onboarding_controller.dart';


// Model for slider content
class SliderContent {
  final String title;
  final String subtitle;
  final String description;
  final String backgroundImage;

  SliderContent({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.backgroundImage,
  });
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final  controller = Get.find<OnboardingController>();

    final List<SliderContent> sliderData = [
      SliderContent(
        title: "Practice built",
        subtitle: "Pitch ready",
        description: "Better every touch",
        backgroundImage: AppImages.player1,
      ),
      SliderContent(
        title: "Every rep builds",
        subtitle: "Every day better",
        description: "",
        backgroundImage: AppImages.player2
      ),
      SliderContent(
        title: "Train in truth",
        subtitle: "Move with fire",
        description: "Play with pride",
        backgroundImage: AppImages.player3
      ),
    ];
    return Scaffold(
      body: Stack(
        children: [
          // Background with different images for each slide
          Obx(() => AnimatedSwitcher(
            duration: Duration(milliseconds: 800),
            child: Container(
              key: ValueKey(controller.currentPage.value),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(sliderData[controller.currentPage.value].backgroundImage),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withAlpha(40),
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
          )),

          // Top Section with Logo and Initials
          Positioned(
            top: MediaQuery.of(context).padding.top + (isTablet ? 30 : 20),
            left: isTablet ? 40 : 20,
            right: isTablet ? 40 : 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo
                Container(
                  width: isTablet ? 80 : 60,
                  height: isTablet ? 80 : 60,
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(90),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(10),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                    image: DecorationImage(image: AssetImage(AppImages.logo), fit: BoxFit.cover)
                  ),
                ),
              ],
            ),
          ),

          // Main Content with PageView for text animation
          Positioned(
            left: isTablet ? 40 : 20,
            right: isTablet ? 40 : 20,
            top: screenHeight * (isTablet ? 0.3 : 0.35),
            child: SizedBox(
              height: screenHeight * 0.4,
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                itemCount: sliderData.length,
                itemBuilder: (context, index) {
                  final content = sliderData[index];
                  return AnimatedOpacity(
                    duration: Duration(milliseconds: 500),
                    opacity: 1.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Main Title
                        Text(
                          content.title,
                          style: TextStyles.title32.copyWith(
                            color: Colors.white,
                            height: 1.1,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Text(
                          content.subtitle,
                          style: TextStyles.title32.copyWith(
                            color: Colors.white,
                            height: 1.1,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(height: isTablet ? 12 : 8),
                        Text(
                          content.description,
                          style: TextStyles.title32.copyWith(
                            color: Colors.white,
                            height: 1.1,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(height: isTablet ? 30 : 20),
                        // Lorem ipsum text
                        Container(
                          width: isTablet ? screenWidth * 0.6 : double.infinity,
                          child: Text(
                            "Massa tincidunt tortor. dui. tempor risus ipsum In nec diam elit elit efficitur. nisl. Quisque urna. tincidunt Nunc lacus.",
                            style: TextStyles.regular12.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                            )
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          // Page Indicators
          Positioned(
            left: 0,
            right: 0,
            bottom: isTablet ? 300 : 250,
            child: Obx(() => Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  sliderData.length, (index) => AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.only(right: isTablet ? 12 : 8),
                    width: controller.currentPage.value == index
                        ? (isTablet ? 24 : 8)
                        : (isTablet ? 12 : 8),
                    height: isTablet ? 12 : 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(isTablet ? 6 : 4),
                      color: controller.currentPage.value == index
                          ? Colors.white
                          : Colors.white.withAlpha(40),
                      boxShadow: controller.currentPage.value == index
                          ? [
                        BoxShadow(
                          color: Colors.white.withAlpha(40),
                          blurRadius: 4,
                          spreadRadius: 1,
                        ),
                      ] : null,
                    ),
                  ),
                ),
              ),
            )),
          ),
        ],
      ),
    );
  }
}