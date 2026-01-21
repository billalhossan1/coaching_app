class GetMyApplicationsModel {
  bool? success;
  String? message;
  Pagination? pagination;
  List<ApplicationCard>? applicationList;

  GetMyApplicationsModel(
      {this.success, this.message, this.pagination, this.applicationList});

  GetMyApplicationsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      applicationList = <ApplicationCard>[];
      json['data'].forEach((v) {
        applicationList!.add(new ApplicationCard.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    if (applicationList != null) {
      data['data'] = applicationList!.map((v) => v.toJson()).toList();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['limit'] = limit;
    data['page'] = page;
    data['totalPage'] = totalPage;
    return data;
  }
}

class ApplicationCard {
  String? sId;
  String? endDate;
  String? startDate;
  String? reason;
  String? status;
  String? createdAt;

  ApplicationCard(
      {this.sId,
        this.endDate,
        this.startDate,
        this.reason,
        this.status,
        this.createdAt});

  ApplicationCard.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    endDate = json['endDate'];
    startDate = json['startDate'];
    reason = json['reason'];
    status = json['status'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['endDate'] = endDate;
    data['startDate'] = startDate;
    data['reason'] = reason;
    data['status'] = status;
    data['createdAt'] = createdAt;
    return data;
  }
}
