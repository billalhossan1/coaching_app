import 'package:football_coaching_coach_app/model/session_details_model.dart';

class CourseHistoryModel {

  Pagination? pagination;
  List<CourseHistoryItem>? courseList;

  CourseHistoryModel({this.pagination, this.courseList});

  CourseHistoryModel.fromJson(Map<String, dynamic> json) {

    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      courseList = <CourseHistoryItem>[];
      json['data'].forEach((v) {
        courseList!.add(CourseHistoryItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    if (this.courseList != null) {
      data['data'] = this.courseList!.map((v) => v.toJson()).toList();
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

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      total: json['total'] != null && json['total'] is int ? json['total'] : 0,
      limit: json['limit'] != null && json['limit'] is int ? json['limit'] : 0,
      page: json['page'] != null && json['page'] is int ? json['page'] : 0,
      totalPage: json['totalPage'] != null && json['totalPage'] is int ? json['totalPage'] : 0,
    );
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


class CourseHistoryItem {
  String? sId;
  String? name;
  String? image;
  String? status;
  String? startDate;
  String? endDate;
  String? createdAt;
  String? updatedAt;
  int? iV;
  Couch? couch;
  String? description;

  CourseHistoryItem(
      {this.sId,
        this.name,
        this.image,
        this.status,
        this.startDate,
        this.endDate,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.couch,
        this.description});

  factory CourseHistoryItem.fromJson(Map<String, dynamic> json) {
    return CourseHistoryItem(
      sId: json['_id'] != null && json['_id'] is String ? json['_id'] : "",
      name: json['name'] != null && json['name'] is String ? json['name'] : "",
      image: json['image'] != null && json['image'] is String ? json['image'] : "",
      status: json['status'] != null && json['status'] is String ? json['status'] : "",
      startDate: json['startDate'] != null && json['startDate'] is String ? json['startDate'] : "",
      endDate: json['endDate'] != null && json['endDate'] is String ? json['endDate'] : "",
      createdAt: json['createdAt'] != null && json['createdAt'] is String ? json['createdAt'] : "",
      updatedAt: json['updatedAt'] != null && json['updatedAt'] is String ? json['updatedAt'] : "",
      iV: json['__v'] != null && json['__v'] is int ? json['__v'] : 0,
      couch: json['couch'] != null && json['couch'] is Map<String, dynamic>
          ? Couch.fromJson(json['couch'])
          : null,
      description: json['description'] != null && json['description'] is String
          ? json['description']
          : "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['image'] = image;
    data['status'] = status;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    if (couch != null) {
      data['couch'] = couch!.toJson();
    }
    data['description'] = description;
    return data;
  }
}

