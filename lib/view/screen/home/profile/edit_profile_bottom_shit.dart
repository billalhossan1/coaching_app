import 'package:flutter/material.dart';
import 'package:football_coaching_coach_app/view/screen/home/controller/home_controller.dart';
import 'package:football_coaching_coach_app/view/screen/home/profile/model/profile_model.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widget/custom_svg.dart'; // Assuming you use Svg for your icons


// The bottom sheet widget for editing the profile
Widget editProfileBottomsheet(ProfileModel? profileModel,HomeController controller) {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  return Container(
    padding: const EdgeInsets.all(20),
    color: Colors.white,
    height: 400.h, // You can adjust the height as required
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header of Bottom Sheet
        Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20),

        // Profile Picture Change (this is just a placeholder)
        Row(
          children: [
            ClipOval(
              child: Image.network(
                profileModel?.profileModel?.image??'', // Placeholder image path
                height: 60.h,
                width: 60.w,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            TextButton(
              onPressed: () {
                // Implement image picking functionality here
              },
              child: const Text('Change Picture'),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Name input field
        Text(
          'Name',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        TextField(
          controller: nameController,
          decoration: const InputDecoration(
            hintText: 'Enter your name',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
        ),
        const SizedBox(height: 20),

        // Email input field
        Text(
          'Email',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
            hintText: 'Enter your email',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
        ),
        const SizedBox(height: 20),

        // Save button
        ElevatedButton(
          onPressed: () {
            // Handle save action here
            String name = nameController.text;
            String email = emailController.text;
            // Perform save action with the updated values
            Get.back(); // Close the bottom sheet
          },
          child: const Text('Save Changes'),
        ),
      ],
    ),
  );
}

// Your main widget that includes the GestureDetector to trigger the bottom sheet

