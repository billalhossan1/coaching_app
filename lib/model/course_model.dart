class CourseListModel {

  Pagination? pagination;
  List<Course>? courseList;

  CourseListModel({this.pagination, this.courseList});

  CourseListModel.fromJson(Map<String, dynamic> json) {

    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      courseList = <Course>[];
      json['data'].forEach((v) {
        courseList!.add( Course.fromJson(v));
      });
    }
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


}

class Course {
  String? sId;
  String? name;
  String? image;
  String? status;
  String? startDate;
  String? endDate;
  String? createdAt;
  String? updatedAt;
  String? couch;

  Course(
      {this.sId,
        this.name,
        this.image,
        this.status,
        this.startDate,
        this.endDate,
        this.createdAt,
        this.updatedAt,
        this.couch});

  Course.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    status = json['status'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    couch = json['couch'];
  }

}
