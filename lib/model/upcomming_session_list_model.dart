class UpcomingSessionListModel {

  Pagination? pagination;
  List<UpComingSessionModel>? upComingSessionList;

  UpcomingSessionListModel(
      { this.pagination, this.upComingSessionList});

  UpcomingSessionListModel.fromJson(Map<String, dynamic> json) {

    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      upComingSessionList = <UpComingSessionModel>[];
      json['data'].forEach((v) {
        upComingSessionList!.add(UpComingSessionModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    if (upComingSessionList != null) {
      data['data'] = upComingSessionList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pagination {
  int? page;
  int? limit;
  int? total;
  int? totalPage;

  Pagination({this.page, this.limit, this.total, this.totalPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
    total = json['total'];
    totalPage = json['totalPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['limit'] = limit;
    data['total'] = total;
    data['totalPage'] = totalPage;
    return data;
  }
}

class UpComingSessionModel {
  String? sId;
  dynamic shedules;
  List<Sessions>? sessions;

  UpComingSessionModel({this.sId, this.shedules, this.sessions});

  UpComingSessionModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    shedules = json['shedules'];
    if (json['sessions'] != null) {
      sessions = <Sessions>[];
      json['sessions'].forEach((v) {
        sessions!.add(Sessions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['shedules'] = shedules;
    if (sessions != null) {
      data['sessions'] = sessions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sessions {
  String? sId;
  Course? course;
  String? title;
  String? status;
  String? startTime;
  String? endTime;
  String? date;
  String? couch;
  String? createdAt;
  String? updatedAt;
  String? sessionDate;

  Sessions(
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
        this.sessionDate});

  Sessions.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    course =
    json['course'] != null ? Course.fromJson(json['course']) : null;
    title = json['title'];
    status = json['status'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    date = json['date'];
    couch = json['couch'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    sessionDate = json['sessionDate'];
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
    data['sessionDate'] = sessionDate;
    return data;
  }
}

class Course {
  String? sId;
  String? name;
  String? image;

  Course({this.sId, this.name, this.image});

  Course.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}
