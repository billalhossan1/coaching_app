class NotificationListModel {

  Pagination? pagination;
  NotificationModel? notification;

  NotificationListModel({ this.pagination, this.notification});

  NotificationListModel.fromJson(Map<String, dynamic> json) {

    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    notification = json['data'] != null ? NotificationModel.fromJson(json['data']) : null;
  }


}

class Pagination {
  int? total;
  int? limit;
  int? page;
  int? totalPage;

  Pagination({this.total, this.limit, this.page, this.totalPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    limit = json['limit'];
    page = json['page'];
    totalPage = json['totalPage'];
  }


}

class NotificationModel {
  int? unreadCount;
  List<NotificationItem>? notificationList;

  NotificationModel({this.unreadCount, this.notificationList});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    unreadCount = json['unreadCount'];
    if (json['notification'] != null) {
      notificationList = <NotificationItem>[];
      json['notification'].forEach((v) {
        notificationList!.add(new NotificationItem.fromJson(v));
      });
    }
  }


}

class NotificationItem {
  String? sId;
  String? title;
  String? body;
  List<String>? reciever;
  List<String>? seener;
  String? path;
  String? referenceId;
  int? iV;
  bool? read;
  String? timeAgo;

  NotificationItem(
      {this.sId,
        this.title,
        this.body,
        this.reciever,
        this.seener,
        this.path,
        this.referenceId,
        this.iV,
        this.read,
        this.timeAgo});

  NotificationItem.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    body = json['body'];
    reciever = json['reciever'].cast<String>();
    path = json['path'];
    referenceId = json['referenceId'];
    iV = json['__v'];
    read = json['read'];
    timeAgo = json['timeAgo'];
  }


}
