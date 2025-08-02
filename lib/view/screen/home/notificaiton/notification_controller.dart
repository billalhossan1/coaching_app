import 'package:flutter/material.dart';
import 'package:football_coaching_coach_app/view/screen/home/controller/home_controller.dart';
import 'package:get/get.dart';

import '../../../../Helper/shared_prefe/shared_prefe.dart' show SharePrefsHelper;
import '../../../../Service/api_url.dart';
import '../../../../Service/socket_service.dart';
import '../../../../model/notification_list_model.dart';
import '../../../../utils/ToastMsg/toast_message.dart' show showCustomSnackBar;
import '../repo/home_screen_repo.dart';

class NotificationController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool isPaginationLoading = false.obs;
  RxList<NotificationItem> notificationList = RxList<NotificationItem>();
  int notificationPage =1;
  int notificationTotalPage =1;
  int notificationCount = 0;
  String? userId;

  @override
  void onInit() {
    print("=====================================================================ajfhsdjkhasdkjfhksadjhkjasdf");
    intial();
    super.onInit();
  }
  void intial()async{
    print("afgijadsfijaisdjf");
    AppSocketAllOperation.instance.initializeSocket();
    // Listen for real-time notifications
    userId = await SharePrefsHelper.getString(ApiConstant.myid);
    getAllNotification();
    notificationScrollController.addListener(notificationListener);

    AppSocketAllOperation.instance.readEvent(
      event: 'notification::$userId',
      handler: (data) {
        // Handle new notification data
        handleNewNotification(data);
      },
    );
  }

  Future<void>getAllNotification({int page =1})async{
    isLoading.value = false;
    Response response = await HomeScreenRepo().getAllNotification(page);
    if(response.statusCode==200){
      NotificationListModel notificationListModel = NotificationListModel.fromJson(response.body);
      notificationList.addAll( notificationListModel.notification!.notificationList??[]);
      notificationTotalPage = notificationListModel.pagination?.totalPage??1;
      notificationCount = notificationListModel.notification?.unreadCount??0;
      print("===========================${notificationCount}");
    }else{
      showCustomSnackBar(response.statusText??"Something went wrong");
    }
  }
  ScrollController notificationScrollController = ScrollController();

  Future<void> notificationListener() async {
    if(notificationScrollController.position.pixels == notificationScrollController.position.maxScrollExtent){
      if(notificationPage<notificationTotalPage){
        isPaginationLoading.value= true;
        notificationPage++;
        await getAllNotification(page: notificationPage);
        isPaginationLoading.value= false;
      }else{
        return;
      }
    }
  }

  Future<void>readAllNotification()async{
    print("read call");
    Response response = await HomeScreenRepo().readAllNotification();
    if(response.statusCode==200){
      notificationCount=0;
      Get.find<HomeController>().update();
    }
  }

  Future<void> handleNewNotification(dynamic data) async {
    try {
      // Assuming data is the notification item
      NotificationItem newNotification = NotificationItem.fromJson(data);

      // Add new notification to the top of the list
      notificationList.insert(0, newNotification);
      showCustomSnackBar("New notification received");
      await getAllNotification();
      update();  // To update the UI

    } catch (e) {
      showCustomSnackBar("Error handling new notification: $e");
    }
  }

  @override
  void onClose() {
    AppSocketAllOperation.instance.dispose();
    notificationScrollController.dispose();
    super.onClose();
  }
}