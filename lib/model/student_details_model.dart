class StudentDetailsModel {

  StudentDetails? studentDetails;

  StudentDetailsModel({ this.studentDetails});

  StudentDetailsModel.fromJson(Map<String, dynamic> json) {

    studentDetails = json['data'] != null ? StudentDetails.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (this.studentDetails != null) {
      data['data'] = this.studentDetails!.toJson();
    }
    return data;
  }
}

class StudentDetails {
  Student? student;
  OverView? overView;
  List<Performance>? performance;

  StudentDetails({this.student, this.overView, this.performance});

  StudentDetails.fromJson(Map<String, dynamic> json) {
    student = json['user'] != null ? Student.fromJson(json['user']) : null;
    overView = json['overView'] != null ? OverView.fromJson(json['overView']) : null;
    if (json['performance'] != null) {
      performance = <Performance>[];
      json['performance'].forEach((v) { performance!.add(Performance.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (student != null) {
      data['user'] = student!.toJson();
    }
    if (overView != null) {
      data['overView'] = overView!.toJson();
    }
    if (performance != null) {
      data['performance'] = performance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Student {
  String? sId;
  String? image;
  String? name;

  Student({this.sId, this.image, this.name});

  Student.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['image'] = image;
    data['name'] = name;
    return data;
  }
}

class OverView {
  String? attandance;
  String? avarageAttandance;
  String? avarageActivity;

  OverView({this.attandance, this.avarageAttandance, this.avarageActivity});

  OverView.fromJson(Map<String, dynamic> json) {
    attandance = json['attandance'];
    avarageAttandance = json['avarageAttandance'];
    avarageActivity = json['avarageActivity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['attandance'] = attandance;
    data['avarageAttandance'] = avarageAttandance;
    data['avarageActivity'] = avarageActivity;
    return data;
  }
}

class Performance {
  String? sId;
  dynamic Class;
  bool? attandance;
  String? performance;
  String? date;

  Performance({this.sId, this.Class, this.attandance, this.performance, this.date});

  Performance.fromJson(Map<String, dynamic> json) {
  sId = json['_id'];
  Class = json['class'];
  attandance = json['attandance'];
  performance = json['performance'];
  date = json['date'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['_id'] = sId;
  data['class'] = Class;
  data['attandance'] = attandance;
  data['performance'] = performance;
  data['date'] = date;
  return data;
  }
}
