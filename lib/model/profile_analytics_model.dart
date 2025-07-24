class ProfileAnalyticsModel {

  ProfileAnalytics? profileAnalytics;

  ProfileAnalyticsModel({ this.profileAnalytics});

  ProfileAnalyticsModel.fromJson(Map<String, dynamic> json) {

    profileAnalytics = json['data'] != null ? ProfileAnalytics.fromJson(json['data']) : null;
  }


}

class ProfileAnalytics {
  OverView? overView;

  ProfileAnalytics({this.overView});

  ProfileAnalytics.fromJson(Map<String, dynamic> json) {
    overView = json['overView'] != null
        ? OverView.fromJson(json['overView'])
        : null;
  }

}

class OverView {
  int? currentCourse;
  int? totalCourse;
  int? totalStudents;

  OverView({this.currentCourse, this.totalCourse, this.totalStudents});

  OverView.fromJson(Map<String, dynamic> json) {
    currentCourse = json['currentCourse'];
    totalCourse = json['totalCourse'];
    totalStudents = json['totalStudents'];
  }


}
