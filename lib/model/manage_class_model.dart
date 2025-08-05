class ManageClassModel {

  ManageClass? data;

  ManageClassModel({ this.data});

  ManageClassModel.fromJson(Map<String, dynamic> json) {

    data = json['data'] != null ? ManageClass.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ManageClass {
  SessionDetails? sessionDetails;
  Overview? overview;
  List<StudentLists>? studentLists;

  ManageClass({this.sessionDetails, this.overview, this.studentLists});

  ManageClass.fromJson(Map<String, dynamic> json) {
    sessionDetails = json['sessionDetails'] != null
        ? SessionDetails.fromJson(json['sessionDetails'])
        : null;
    overview = json['overview'] != null
        ? Overview.fromJson(json['overview'])
        : null;
    if (json['studentLists'] != null) {
      studentLists = <StudentLists>[];
      json['studentLists'].forEach((v) {
        studentLists!.add(StudentLists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sessionDetails != null) {
      data['sessionDetails'] = sessionDetails!.toJson();
    }
    if (overview != null) {
      data['overview'] = overview!.toJson();
    }
    if (studentLists != null) {
      data['studentLists'] = studentLists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SessionDetails {
  String? name;
  String? date;
  String? startTime;
  String? endTime;
  String? courseName;
  String? courseId;

  SessionDetails(
      {this.name,
        this.date,
        this.startTime,
        this.endTime,
        this.courseName,
        this.courseId});

  SessionDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    courseName = json['courseName'];
    courseId = json['courseId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['date'] = date;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['courseName'] = courseName;
    data['courseId'] = courseId;
    return data;
  }
}

class Overview {
  dynamic totalStudents;
  String? avarageAttandance;
  String? avarageActivity;

  Overview({this.totalStudents, this.avarageAttandance, this.avarageActivity});

  Overview.fromJson(Map<String, dynamic> json) {
    totalStudents = json['totalStudents'];
    avarageAttandance = json['avarageAttandance'];
    avarageActivity = json['avarageActivity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalStudents'] = totalStudents;
    data['avarageAttandance'] = avarageAttandance;
    data['avarageActivity'] = avarageActivity;
    return data;
  }
}

class StudentLists {
  String? image;
  String? name;
  String? totalPerformance;
  String? userId;
  bool? attandance;
  String? homeWork;

  StudentLists(
      {this.image,
        this.name,
        this.totalPerformance,
        this.attandance,
        this.homeWork,this.userId});

  StudentLists.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    totalPerformance = json['totalPerformance'];

    // Convert the 'attendance' field to a boolean if it's a string
    attandance = json['attandance'] is String ? json['attandance'] == 'true' : json['attandance'];

    userId = json['userId'];

    // Convert the 'homeWork' field to a boolean if it's a string
    homeWork= json['homeWork'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['userId'] = userId;
    data['totalPerformance'] = totalPerformance;
    data['attandance'] = attandance;
    data['homeWork'] = homeWork;
    return data;
  }
}
