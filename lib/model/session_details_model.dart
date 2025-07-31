class SessionDetailsModel {

  SessionDetails? sessionDetails;

  SessionDetailsModel({ this.sessionDetails});

  SessionDetailsModel.fromJson(Map<String, dynamic> json) {

    sessionDetails = json['data'] != null ? SessionDetails.fromJson(json['data']) : null;
  }

}

class SessionDetails {
  SessionInfo? sessionInfo;
  Homework? homework;
  List<StudentList>? studentList;

  SessionDetails({this.sessionInfo, this.homework, this.studentList});

  SessionDetails.fromJson(Map<String, dynamic> json) {
    sessionInfo = json['sessionInfo'] != null
        ? SessionInfo.fromJson(json['sessionInfo'])
        : null;
    homework = json['homework'] != null
        ? Homework.fromJson(json['homework'])
        : null;
    if (json['studentList'] != null) {
      studentList = <StudentList>[];
      json['studentList'].forEach((v) {
        studentList!.add(StudentList.fromJson(v));
      });
    }
  }
}

class SessionInfo {
  String? sId;
  Course? course;
  String? title;
  String? status;
  String? startTime;
  String? endTime;
  String? date;
  Couch? couch;
  String? createdAt;
  String? updatedAt;
  int? iV;

  SessionInfo(
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
        this.iV});

  SessionInfo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    course =
    json['course'] != null ? Course.fromJson(json['course']) : null;
    title = json['title'];
    status = json['status'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    date = json['date'];
    couch = json['couch'] != null ? Couch.fromJson(json['couch']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

}

class Course {
  String? sId;
  String? name;

  Course({this.sId, this.name});

  Course.fromJson(Map<String, dynamic> json) {
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

class Couch {
 final String sId;
 final String name;
 final String image;

  Couch({this.sId = "", this.name = "", this.image = ""});

 factory Couch.fromJson(Map<String, dynamic> json) {
   return Couch(sId: json['_id'] != null &&  json['_id'] is String ?  json['_id'] : "",
       name: json['name'] != null &&  json['name'] is String ?  json['name'] : "",
     image: json['image']  != null && json['image'] is String ? json['image'] : ""
   );

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}

class Homework {
  String? sId;
  Course? course;
  String? session;
  String? title;
  String? description;
  String? couch;
  String? deadline;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Homework(
      {this.sId,
        this.course,
        this.session,
        this.title,
        this.description,
        this.couch,
        this.deadline,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Homework.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    course =
    json['course'] != null ? Course.fromJson(json['course']) : null;
    session = json['session'];
    title = json['title'];
    description = json['description'];
    couch = json['couch'];
    deadline = json['deadline'];
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
    data['session'] = session;
    data['title'] = title;
    data['description'] = description;
    data['couch'] = couch;
    data['deadline'] = deadline;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class StudentList {
  String? sId;
  String? image;
  String? name;
  String? performance;
  bool? atandance;
  dynamic homework; // Use dynamic to accept both String (ID) or Homework

  StudentList({
    this.sId,
    this.image,
    this.name,
    this.performance,
    this.atandance,
    this.homework,
  });

  StudentList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
    name = json['name'];
    performance = json['performance'];
    atandance = json['atandance'];
    if (json['homework'] != null) {
      if (json['homework'] is String) {
        homework = json['homework']; // If homework is just an ID (String)
      } else {
        homework = Homework.fromJson(json['homework']); // If homework is an object, parse it
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['image'] = image;
    data['name'] = name;
    data['performance'] = performance;
    data['atandance'] = atandance;
    if (homework != null) {
      if (homework is Homework) {
        data['homework'] = homework.toJson(); // Serialize homework if it's a Homework object
      } else {
        data['homework'] = homework; // Otherwise just pass the string (ID)
      }
    }
    return data;
  }
}


