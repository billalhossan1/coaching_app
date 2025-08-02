
class SessionsListByIdModel {

  Pagination? pagination;
  List<SessionItem>? sessionList;

  SessionsListByIdModel(
      { this.pagination, this.sessionList});

  SessionsListByIdModel.fromJson(Map<String, dynamic> json) {

    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      sessionList = <SessionItem>[];
      json['data'].forEach((v) {
        sessionList!.add(SessionItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    if (this.sessionList != null) {
      data['data'] = this.sessionList!.map((v) => v.toJson()).toList();
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

class SessionItem {
  String? sId;
  CourseModel? course;
  String? title;
  String? status;
  String? startTime;
  String? endTime;
  String? date;
  String? couch;
  String? createdAt;
  String? updatedAt;
  int? iV;

  SessionItem({
    this.sId,
    this.course,
    this.title,
    this.status,
    this.startTime,
    this.endTime,
    this.date,
    this.couch,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  SessionItem.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    course = json['course'] != null ? CourseModel.fromJson(json['course']) : null;
    title = json['title'];
    status = json['status'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    date = json['date'];

    if (json['couch'] is String) {
      couch = json['couch'];
    } else if (json['couch'] is Map<String, dynamic>) {
      couch = json['couch']['_id'];
    } else {
      couch = null;
    }

    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (course != null) {
      data['course'] = course!.toJson();
    }
    data['title'] = title;
    data['status'] = status;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['date'] = date;
    data['couch'] = couch;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
class CourseModel {
  String? id;
  String? name;

  CourseModel({this.id, this.name});

  CourseModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    return data;
  }
}
