import 'dart:io';
import 'package:flutter/material.dart';
import 'package:football_coaching_coach_app/view/widget/size.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/Texts/text_style.dart';
import '../../utils/ToastMsg/toast_message.dart';

void imageInput({required RxString localImagePath, required Function() callBack}) {
  Get.bottomSheet(
    Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header with close button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select Image Source',
                  style: TextStyles.regular12.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(Get.context!),
                  icon: Icon(
                    Icons.close,
                    color: Colors.grey[600],
                    size: 24,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ],
            ),
            const HeightGap(height: 20),

            // Image source options
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(Get.context!);
                      appUserImagePic(
                        source: ImageSource.camera,
                        localImagePath: localImagePath,
                        callBack: callBack,
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.blue[200]!, width: 1),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 48,
                            color: Colors.blue[600],
                          ),
                          const HeightGap(height: 8),
                          Text(
                            'Camera',
                            style: TextStyles.regular12.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.blue[700],
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(Get.context!);
                      appUserImagePic(
                        source: ImageSource.gallery,
                        localImagePath: localImagePath,
                        callBack: callBack,
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                      margin: EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.green[200]!, width: 1),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.collections,
                            size: 48,
                            color: Colors.green[600],
                          ),
                          const HeightGap(height: 8),
                          Text(
                            'Gallery',
                            style: TextStyles.regular12.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.green[700],
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const HeightGap(height: 20),
          ],
        ),
      ),
    ),
  );
}

Future<void> appUserImagePic({
  required ImageSource source,
  required RxString localImagePath,
  required Function() callBack,
}) async {
  try {
    bool permissionGranted = false;

    if (source == ImageSource.camera) {
      final status = await Permission.camera.status;
      if (status.isGranted || status.isLimited) {
        permissionGranted = true;
      }

      if (status.isDenied) {
        var response = await askFirst(
          title: "Camera Access Required",
          content: "We need access to your camera so you can update your profile picture",
          acceptButton: "Continue",
        );
        if (response) {
          final request = await Permission.camera.request();
          if (request.isGranted || request.isLimited) {
            permissionGranted = true;
          }
        }
      }

      if (status.isPermanentlyDenied) {
        var response = await getCallAgainPermission(
          title: "Camera Access Needed",
          content:
              "We need access to your camera so you can take or update your profile picture. We respect your privacy and only use the camera when you choose to use this feature.\n\nYou can enable camera access in your device settings.",
          acceptButton: "Open Settings",
        );
        if (response) {
          final request = await Permission.camera.request();
          if (request.isGranted || request.isLimited) {
            permissionGranted = true;
          }
        }
      }
    } else {
      // Gallery access
      if (Platform.isIOS) {
        final status = await Permission.photos.status;

        if (status.isGranted || status.isLimited) {
          permissionGranted = true;
        }
        if (status.isDenied) {
          var response = await askFirst(
            acceptButton: "Continue",
            title: "Allow Access to Photos and Media",
            content:
                "We need access to your device's media library so you can select photos, videos, or files, like updating your profile picture or uploading documents.\n\nYour data is never shared and stays on your device unless you choose to upload it.",
          );
          if (response) {
            final request = await Permission.photos.request();

            if (request.isGranted || request.isLimited) {
              permissionGranted = true;
            }
          }
        }

        if (status.isPermanentlyDenied) {
          var response = await getCallAgainPermission(
            acceptButton: "Open Settings",
            title: "Allow Access to Photos and Media",
            content:
                "We need access to your device's media library so you can select photos, videos, or files, like updating your profile picture or uploading documents.\n\nYour data is never shared and stays on your device unless you choose to upload it.",
          );
          if (response) {
            final request = await Permission.photos.request();
            if (request.isGranted || request.isLimited) {
              permissionGranted = true;
            }
          } else {
            return;
          }
        }
      } else if (Platform.isAndroid) {
        // For Android 13+ (API 33+), we need to check API level
        Permission permission;
        try {
          // Try to use photos permission first (for newer Android versions)
          permission = Permission.photos;
          var status = await permission.status;

          // If photos permission is not available, fallback to storage
          if (status == PermissionStatus.denied && !await permission.isRestricted) {
            permission = Permission.storage;
            status = await permission.status;
          }

          if (status.isGranted || status.isLimited) {
            permissionGranted = true;
          } else if (status.isDenied) {
            var response = await askFirst(
              acceptButton: "Continue",
              title: "Allow Access to Photos and Media",
              content:
                  "We need access to your device's media library so you can select photos, videos, or files, like updating your profile picture or uploading documents.\n\nYour data is never shared and stays on your device unless you choose to upload it.",
            );
            if (response) {
              final request = await permission.request();
              if (request.isGranted || request.isLimited) {
                permissionGranted = true;
              } else if (request.isPermanentlyDenied) {
                // If permanently denied, show settings dialog
                var settingsResponse = await getCallAgainPermission(
                  acceptButton: "Open Settings",
                  title: "Permission Required",
                  content: "Please enable photo access in app settings to continue.",
                );
                if (settingsResponse) {
                  await openAppSettings();
                }
              }
            }
          } else if (status.isPermanentlyDenied) {
            var response = await getCallAgainPermission(
              acceptButton: "Open Settings",
              title: "Allow Access to Photos and Media",
              content:
                  "Photo access is permanently denied. Please enable it in app settings to select images from your gallery.",
            );
            if (response) {
              await openAppSettings();
            }
          }
        } catch (e) {
          // Fallback: try without permission (some Android versions don't need it)
          print("Permission error: $e");
          permissionGranted = true; // Try anyway, ImagePicker might handle it
        }
      }
    }

    if (permissionGranted) {
      final picked = await ImagePicker().pickImage(
        source: source,
        imageQuality: 85,
        maxWidth: 1024,
        maxHeight: 1024,
      );
      if (picked != null) {
        localImagePath.value = picked.path;
        callBack();
      }
    } else if (source == ImageSource.gallery) {
      // Fallback: Try ImagePicker without explicit permission
      // ImagePicker handles permissions internally on newer Android versions
      try {
        final picked = await ImagePicker().pickImage(
          source: source,
          imageQuality: 85,
          maxWidth: 1024,
          maxHeight: 1024,
        );
        if (picked != null) {
          localImagePath.value = picked.path;
          callBack();
        }
      } catch (e) {
        showCustomSnackBar("Unable to access gallery. Please check app permissions in settings.");
      }
    }
  } catch (e) {
    showCustomSnackBar("Something went wrong: ${e.toString()}");
  }
}

Future<bool> askFirst({
  String title = "Gallery",
  String content = "This permission is required to continue. Please enable it from settings.",
  String acceptButton = "Continue",
  String cancelButton = "Cancel",
}) async {
  bool userConfirmed = false;

  await Get.defaultDialog(
    title: title,
    titleStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.grey[800],
    ),
    backgroundColor: Colors.white,
    content: Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        content,
        textAlign: TextAlign.center,
        style: TextStyles.regular12.copyWith(
          fontWeight: FontWeight.w400,
          color: Colors.grey[700],
          fontSize: 14,
          height: 1.4,
        ),
      ),
    ),
    radius: 12,
    confirm: Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          userConfirmed = true;
          Get.back();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[600],
          foregroundColor: Colors.white,
          elevation: 0,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          'Accept',
          style: TextStyles.regular12.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    ),
    cancel: Container(
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          userConfirmed = false;
          Get.back();
        },
        style: TextButton.styleFrom(
          foregroundColor: Colors.grey[600],
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          'Cancel',
          style: TextStyles.regular12.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
      ),
    ),
  );
  return userConfirmed;
}

Future<bool> getCallAgainPermission({
  String title = "Gallery",
  String content = "This permission is required to continue. Please enable it from settings.",
  String acceptButton = "Open Settings",
  String cancelButton = "Cancel",
}) async {
  bool userConfirmed = false;

  await Get.defaultDialog(
    title: title,
    titleStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.grey[800],
    ),
    backgroundColor: Colors.white,
    content: Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        content,
        textAlign: TextAlign.center,
        style: TextStyles.regular12.copyWith(
          fontWeight: FontWeight.w400,
          color: Colors.grey[700],
          fontSize: 14,
          height: 1.4,
        ),
      ),
    ),
    radius: 12,
    confirm: Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          userConfirmed = true;
          Get.back();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange[600],
          foregroundColor: Colors.white,
          elevation: 0,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          'Open Settings',
          style: TextStyles.regular12.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    ),
    cancel: Container(
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          userConfirmed = false;
          Get.back();
        },
        style: TextButton.styleFrom(
          foregroundColor: Colors.grey[600],
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          'Cancel',
          style: TextStyles.regular12.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
      ),
    ),
  );

  if (userConfirmed) {
    await openAppSettings();
  }

  return userConfirmed;
}