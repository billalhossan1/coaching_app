class PerformanceModel {
  bool? success;
  String? message;
  List<Performance>? performance;

  PerformanceModel({this.success, this.message, this.performance});

  PerformanceModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      performance = <Performance>[];
      json['data'].forEach((v) {
        performance!.add(Performance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (performance != null) {
      data['data'] = performance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Performance {
  String? topic;
  dynamic score;
  String? sId;

  Performance({this.topic, this.score, this.sId});

  Performance.fromJson(Map<String, dynamic> json) {
    topic = json['topic'];
    score = json['score'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['topic'] = topic;
    data['score'] = score;
    data['_id'] = sId;
    return data;
  }
}
