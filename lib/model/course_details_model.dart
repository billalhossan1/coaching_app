class CourseResponse {
  bool? success;
  String? message;
  CourseData? data;

  CourseResponse({this.success, this.message, this.data});

  factory CourseResponse.fromJson(Map<String, dynamic> json) {
    return CourseResponse(
      success: json['success'],
      message: json['message'],
      data: json['data'] != null ? CourseData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class CourseData {
  CourseDetails? courseDetails;
  Overview? overview;
  List<Performance>? performance;

  CourseData({this.courseDetails, this.overview, this.performance});

  factory CourseData.fromJson(Map<String, dynamic> json) {
    return CourseData(
      courseDetails: json['courseDetails'] != null
          ? CourseDetails.fromJson(json['courseDetails'])
          : null,
      overview: json['overview'] != null ? Overview.fromJson(json['overview']) : null,
      performance: json['performance'] != null
          ? List<Performance>.from(json['performance'].map((x) => Performance.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (courseDetails != null) {
      data['courseDetails'] = courseDetails!.toJson();
    }
    if (overview != null) {
      data['overview'] = overview!.toJson();
    }
    if (performance != null) {
      data['performance'] = performance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CourseDetails {
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

  CourseDetails(
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

  factory CourseDetails.fromJson(Map<String, dynamic> json) {
    return CourseDetails(
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

class Couch {
  String? sId;
  String? name;
  String? image;

  Couch({this.sId, this.name, this.image});

  factory Couch.fromJson(Map<String, dynamic> json) {
    return Couch(
      sId: json['_id'] != null && json['_id'] is String ? json['_id'] : "",
      name: json['name'] != null && json['name'] is String ? json['name'] : "",
      image: json['image'] != null && json['image'] is String ? json['image'] : "",
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

class Overview {
  String? attandance;
  String? avarageActivity;
  String? avarageAttandance;

  Overview({this.attandance, this.avarageActivity, this.avarageAttandance});

  factory Overview.fromJson(Map<String, dynamic> json) {
    return Overview(
      attandance: json['attandance'] != null && json['attandance'] is String
          ? json['attandance']
          : "",
      avarageActivity: json['avarageActivity'] != null && json['avarageActivity'] is String
          ? json['avarageActivity']
          : "",
      avarageAttandance: json['avarageAttandance'] != null && json['avarageAttandance'] is String
          ? json['avarageAttandance']
          : "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['attandance'] = attandance;
    data['avarageActivity'] = avarageActivity;
    data['avarageAttandance'] = avarageAttandance;
    return data;
  }
}

class Performance {
  dynamic session;
  String? date;
  String? performance;
  bool? attandance;

  Performance({this.session, this.date, this.performance, this.attandance});

  factory Performance.fromJson(Map<String, dynamic> json) {
    return Performance(
      session: json['session'] != null && json['session'] is int ? json['session'] : 0,
      date: json['date'] != null && json['date'] is String ? json['date'] : "",
      performance: json['performance'] != null && json['performance'] is String
          ? json['performance']
          : "",
      attandance: json['attandance'] != null && json['attandance'] is bool
          ? json['attandance']
          : false,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['session'] = session;
    data['date'] = date;
    data['performance'] = performance;
    data['attandance'] = attandance;
    return data;
  }
}
