import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widget/custom_svg.dart';
import '../controller/home_controller.dart';
import 'model/profile_model.dart'; // Assuming you use Svg for your icons

// The bottom sheet widget for editing the profile
Widget editProfileBottomsheet(ProfileModel? profileModel, HomeController controller) {
  return Container(
    padding: const EdgeInsets.all(20),
    height: 500.h,
    decoration: BoxDecoration(
      color: Colors.cyan,
      borderRadius: BorderRadius.circular(10)
    ),
    child: SingleChildScrollView(  // Add this widget to make content scrollable
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
                  profileModel?.profileModel?.image ?? '', // Placeholder image path
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
            controller: controller.nameController,
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
            controller: controller.emailController,
            decoration: const InputDecoration(
              hintText: 'Enter your email',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
          ),
          const SizedBox(height: 20),

          // Contact No input field
          Text(
            'Contact No',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          TextField(
            controller: controller.emailController,
            decoration: const InputDecoration(
              hintText: 'Enter your contact number',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
          ),
          const SizedBox(height: 20),

          // Nationality input field
          Text(
            'Nationality',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          TextField(
            controller: controller.emailController,
            decoration: const InputDecoration(
              hintText: 'Enter your nationality',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
          ),
          const SizedBox(height: 20),

          // Address input field
          Text(
            'Address',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          TextField(
            controller: controller.emailController,
            decoration: const InputDecoration(
              hintText: 'Enter your address',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
          ),
          const SizedBox(height: 20),

          // Save button
          ElevatedButton(
            onPressed: () {
              // Handle save action here
              String name = controller.nameController.text;
              String email = controller.emailController.text;
              // Perform save action with the updated values
              Get.back(); // Close the bottom sheet
            },
            child: const Text('Save Changes'),
          ),
        ],
      ),
    ),
  );
}
