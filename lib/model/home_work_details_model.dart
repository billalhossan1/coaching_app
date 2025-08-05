class ViewHomeWorkModel {
  bool? success;
  String? message;
  HomeWork? homeWork;

  ViewHomeWorkModel({this.success, this.message, this.homeWork});

  ViewHomeWorkModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    homeWork = json['data'] != null ? HomeWork.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (homeWork != null) {
      data['data'] = homeWork!.toJson();
    }
    return data;
  }
}

class HomeWork {
  String? sId;
  Student? student;
  Homework? homework;
  String? session;
  String? course;
  String? video;
  String? createdAt;
  String? updatedAt;
  int? iV;

  HomeWork(
      {this.sId,
        this.student,
        this.homework,
        this.session,
        this.course,
        this.video,
        this.createdAt,
        this.updatedAt,
        this.iV});

  HomeWork.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    student =
    json['student'] != null ? Student.fromJson(json['student']) : null;
    homework = json['homework'] != null
        ? Homework.fromJson(json['homework'])
        : null;
    session = json['session'];
    course = json['course'];
    video = json['video'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (student != null) {
      data['student'] = student!.toJson();
    }
    if (homework != null) {
      data['homework'] = homework!.toJson();
    }
    data['session'] = session;
    data['course'] = course;
    data['video'] = video;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Student {
  String? sId;
  String? name;
  String? image;

  Student({this.sId, this.name, this.image});

  Student.fromJson(Map<String, dynamic> json) {
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

class Homework {
  String? sId;
  String? title;
  String? description;

  Homework({this.sId, this.title, this.description});

  Homework.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}
