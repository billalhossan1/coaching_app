class SingleSessionModel {

  SingleSession? singleSession;

  SingleSessionModel({ this.singleSession});

  SingleSessionModel.fromJson(Map<String, dynamic> json) {

    singleSession = json['data'] != null ? SingleSession.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (singleSession != null) {
      data['data'] = singleSession!.toJson();
    }
    return data;
  }
}

class SingleSession {
  String? sId;
  CourseItem? course;
  String? title;
  String? status;
  String? startTime;
  String? endTime;
  String? date;
  String? couch;
  String? createdAt;
  String? updatedAt;

  SingleSession(
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

  SingleSession.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    course =
    json['course'] != null ? CourseItem.fromJson(json['course']) : null;
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
    return data;
  }
}

class CourseItem {
  String? sId;
  String? name;

  CourseItem({this.sId, this.name});

  CourseItem.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}
