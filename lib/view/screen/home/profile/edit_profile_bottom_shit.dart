import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_coaching_coach_app/Service/api_url.dart';
import 'package:football_coaching_coach_app/utils/AppColors/app_colors.dart';
import 'package:football_coaching_coach_app/view/widget/conditional_image_widget.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../widget/custom_svg.dart';
import '../controller/home_controller.dart';
import 'model/profile_model.dart'; // Assuming you use Svg for your icons

// The bottom sheet widget for editing the profile
Widget editProfileBottomsheet(
  ProfileModel? profileModel,
  HomeController controller,BuildContext context
) {
  return Container(
    padding: const EdgeInsets.all(20),
    height: 500.h,
    decoration: BoxDecoration(
      color: AppColors.black900,
      borderRadius: BorderRadius.circular(10),
    ),
    child: SingleChildScrollView(
      // Add this widget to make content scrollable
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header of Bottom Sheet
          Text(
            'Edit Profile',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),

          // Profile Picture Change (this is just a placeholder)
          GetBuilder<HomeController>(
            builder: (context) {
              return Row(
                children: [
                  controller.selectedImage == null
                      ? ClipOval(
                    child: ConditionalImageWidget(imageUrl: profileModel?.profileModel?.image ??
                        '', width: 60.w, height: 60.h, baseUrl: ApiConstant.imageUrl)
                  )
                      : ClipOval(
                    child: Image.file(
                      controller.selectedImage!, // Placeholder image path
                      height: 60.h,
                      width: 60.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  TextButton(
                    onPressed: () {
                      controller.pickImage(ImageSource.gallery);
                    },
                    child: const Text(
                      'Change Picture',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            }
          ),
          const SizedBox(height: 20),

          // Name input field
          Text(
            'Name',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          TextField(
            controller: controller.nameController,
            style: const TextStyle(color: Colors.white70),
            decoration: const InputDecoration(
              hintText: 'Enter your name',
              hintStyle: TextStyle(color: Colors.white24),
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
            ),
          ),
          const SizedBox(height: 20),

          const SizedBox(height: 20),

          // Contact No input field
          Text(
            'Contact No',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          TextField(
            controller: controller.contactTEController,
            style: const TextStyle(color: Colors.white70),
            decoration: const InputDecoration(
              hintText: 'Enter your contact number',
              hintStyle: TextStyle(color: Colors.white24),

              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Nationality input field
          Text(
            'Nationality',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          TextField(
            controller: controller.nationalityTEController,
            style: const TextStyle(color: Colors.white70),
            decoration: const InputDecoration(
              hintText: 'Enter your nationality',
              hintStyle: TextStyle(color: Colors.white24),

              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Address input field
          Text(
            'Address',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          TextField(
            controller: controller.addressTEController,
            style: const TextStyle(color: Colors.white70),
            decoration: const InputDecoration(
              hintText: 'Enter your address',
              hintStyle: TextStyle(color: Colors.white24),

              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Save button
          Obx(()=>controller.isUpdateProfileLoading.value?CircularProgressIndicator():ElevatedButton(
            onPressed: () {
              controller.onTapUpdate(context);
            },
            child: const Text('Save Changes'),
          ),)
        ],
      ),
    ),
  );
}
