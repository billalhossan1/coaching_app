class CourseOverViewModel {

  CourseOverview? courseOverview;

  CourseOverViewModel({ this.courseOverview});

  CourseOverViewModel.fromJson(Map<String, dynamic> json) {

    courseOverview = json['data'] != null ? CourseOverview.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (courseOverview != null) {
      data['data'] = courseOverview!.toJson();
    }
    return data;
  }
}

class CourseOverview {
  Overview? overview;

  CourseOverview({this.overview});

  CourseOverview.fromJson(Map<String, dynamic> json) {
    overview = json['overview'] != null
        ? Overview.fromJson(json['overview'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (overview != null) {
      data['overview'] = overview!.toJson();
    }
    return data;
  }
}

class Overview {
  int? totalStudents;
  String? attandanceRate;
  String? totalActivity;

  Overview({this.totalStudents, this.attandanceRate, this.totalActivity});

  Overview.fromJson(Map<String, dynamic> json) {
    totalStudents = json['totalStudents'];
    attandanceRate = json['attandanceRate'];
    totalActivity = json['totalActivity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalStudents'] = totalStudents;
    data['attandanceRate'] = attandanceRate;
    data['totalActivity'] = totalActivity;
    return data;
  }
}
