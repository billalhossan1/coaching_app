class SessionListModel {

  Pagination? pagination;
  List<Session>? data;

  SessionListModel({ this.pagination, this.data});

  SessionListModel.fromJson(Map<String, dynamic> json) {

    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      data = <Session>[];
      json['data'].forEach((v) {
        data!.add(Session.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
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

class Session {
  String? sId;
  String? course;
  String? title;
  String? status;
  String? startTime;
  String? endTime;
  String? date;
  String? couch;
  String? createdAt;
  String? updatedAt;

  Session(
      {this.sId,
        this.course,
        this.title,
        this.status,
        this.startTime,
        this.endTime,
        this.date,
        this.couch,
        this.createdAt,
        this.updatedAt,
      });

  Session.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    course = json['course'];
    title = json['title'];
    status = json['status'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    date = json['date'];
    couch = json['couch'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['course'] = course;
    data['title'] = title;
    data['status'] = status;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['date'] = date;
    data['couch'] = couch;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
