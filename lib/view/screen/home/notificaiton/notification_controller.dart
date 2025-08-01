import 'package:flutter/material.dart';
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
  RxInt notificationCount = 0.obs;
  String? userId;

  @override
  void onInit() {
    intial();
    super.onInit();
  }
  void intial()async{
    userId = await SharePrefsHelper.getString(ApiConstant.myid);
    getAllNotification();

  }

  Future<void>getAllNotification({int page =1})async{
    isLoading.value = false;
    Response response = await HomeScreenRepo().getAllNotification(page);
    if(response.statusCode==200){
      NotificationListModel notificationListModel = NotificationListModel.fromJson(response.body);
      notificationList.addAll( notificationListModel.notification!.notificationList??[]);
      notificationTotalPage = notificationListModel.pagination?.totalPage??1;
      notificationCount.value = notificationListModel.notification?.unreadCount??0;
      print("===========================${notificationCount.value}");
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
    Response response = await HomeScreenRepo().readAllNotification();
    if(response.statusCode!=200){
      showCustomSnackBar("Something went wrong");    }
  }

  void handleNewNotification(dynamic data) {
    try {
      // Assuming data is the notification item
      NotificationItem newNotification = NotificationItem.fromJson(data);

      // Add new notification to the top of the list
      notificationList.insert(0, newNotification);
      showCustomSnackBar("New notification received");
      getAllNotification();
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