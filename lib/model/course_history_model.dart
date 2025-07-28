class CourseHistoryModel {

  Pagination? pagination;
  List<CourseHistoryItem>? courseList;

  CourseHistoryModel({this.pagination, this.courseList});

  CourseHistoryModel.fromJson(Map<String, dynamic> json) {

    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      courseList = <CourseHistoryItem>[];
      json['data'].forEach((v) {
        courseList!.add(CourseHistoryItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    if (this.courseList != null) {
      data['data'] = this.courseList!.map((v) => v.toJson()).toList();
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

class CourseHistoryItem {
  String? sId;
  String? name;
  String? image;
  String? status;
  String? startDate;
  String? endDate;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? couch;
  String? description;

  CourseHistoryItem(
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

  CourseHistoryItem.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    status = json['status'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    couch = json['couch'];
    description = json['description'];
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
    data['couch'] = couch;
    data['description'] = description;
    return data;
  }
}
