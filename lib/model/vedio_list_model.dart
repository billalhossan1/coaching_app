class VideoListModel {

  Pagination? pagination;
  List<VideoModel>? videoList;

  VideoListModel({ this.pagination, this.videoList});

  VideoListModel.fromJson(Map<String, dynamic> json) {

    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      videoList = <VideoModel>[];
      json['data'].forEach((v) {
        videoList!.add(VideoModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    if (videoList != null) {
      data['data'] = videoList!.map((v) => v.toJson()).toList();
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

class VideoModel {
  String? sId;
  String? title;
  String? description;
  String? video;
  String? topic;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? thumbnail;

  VideoModel(
      {this.sId,
        this.title,
        this.description,
        this.video,
        this.topic,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.thumbnail});

  VideoModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    video = json['video'];
    topic = json['topic'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['description'] = description;
    data['video'] = video;
    data['topic'] = topic;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['thumbnail'] = thumbnail;
    return data;
  }
}
