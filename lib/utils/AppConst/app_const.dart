class AppConstants {
  static String bearerToken = "BearerToken";
  // static String userId = "UserId";
  static String onBoard = "Onboard";

  /// <====================== All Response Message Static==============================>

  static String successfull = "Request Successfull";
  static String error = "Oops, something went wrong";
  static String profileID = "profileID";
  static String userStatus = "userStatus";
  static String rememberMe = "rememberMe";
  static var chatId = "chatID";

  static String onlineImage =
      "https://images.unsplash.com/photo-1546961329-78bef0414d7c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHVzZXJ8ZW58MHx8MHx8fDA%3D";

  static String teethHelth =
      "https://images.unsplash.com/photo-1606811971618-4486d14f3f99?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dGVldGh8ZW58MHx8MHx8fDA%3D";

  static String enrollText='''We are excited to announce that enrollment is now open for the [Institution Name] Football Academy! This program is designed for students who are passionate about football and want to improve their skills, fitness, teamwork, and game understanding. Professional coaching by certified trainers. Weekly training sessions. Fitness and nutrition guidance. Friendly matches and tournament participation. Special workshops on leadership, discipline, and teamwork''';
}

enum Status { loading, error, completed, internetError }
