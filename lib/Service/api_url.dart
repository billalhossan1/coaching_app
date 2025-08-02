class ApiConstant {

  static const baseUrl="http://10.10.7.6:5000/api/v1/";//31.97.114.108:5000  10.10.7.6:5000
  static const imageUrl="http://10.10.7.6:5000/";
  static const videoUrl="http://10.10.7.6:5000/api/v1/tutorial/video/";
  static const socketUrl="http://10.10.7.6:5000/";
  static const myid = "myid";


  // static const baseUrl="http://10.0.70.30:5200/api/v1";
  // static const imageUrl="http://10.0.70.30:5200";
  // static const socketUrl="http://10.0.70.30:5200";

  // static const baseUrl="http://10.0.70.208:5200/api/v1";
  // static const imageUrl="http://10.0.70.208:5200";
  // static const socketUrl="http://10.0.70.208:5200";

  ///<================= For Auth And Home part ====================>
  static const create_user = "/user";
  static const getCourse = "/course";
  static const getHomeWork = "/homework";
  static const auth_login = "/auth/login";
  static const forgot_password = "/auth/forget-password";
  static const verify_email = "/auth/verify-email";
  static const reset_password = "/auth/reset-password";
  static const resend_otp = "/auth/resend-otp";
  static const get_profile = "/user/profile";
  static const change_password = "/auth/change-password";
  static const update_profile = "/user/profile";
  static const user_info = "/user/info";
  static const create_post = "/post";
  static const fetch_post = "/post";
  static const like = "/like";
  static const create_comment = "/comment";
  static const add_story = "/story";
  static const fetch_story = "/story";
  static const make_save = "/bookmark";
  static const notification = "/notification";
  static const getSessionById = "/session";
  static const getUpComingSessionToday = "/session/upcomming-toady";
  static const getProfileAnalytics = "/user/couch-analatycs";
  static const getUpComingSession = "/session/upcomming-couch";
  static const delete_account = "/user/delete-account";
  static const interest_selection = "/user/interest";
  static const info = "/onboarding";
  static const getVideo = "/tutorial";
  static const assignHomeWork = "/homework";
  static const updatePerformanceUrl = "/performance/student-mark";
  static const updateAttandence = "/performance";
  static const studentDetails = "/performance/student";
  static const performanceStudentMark = "/performance/student-mark";
  static String storyDetails(var id)=>"/story/$id";
  static String sessionDetails(var id)=>"/session/$id";
  static String courseOverviewUrl(var id)=>"/course/course-overview/$id";
  static String manageClassByIdUrl(var id)=>"/course/manage-class/$id";
  static String postData(var id)=>"/post/$id";


///<================ Friends and Group ===================>

  static const suggest_friends = "/friends/suggestion-friends";
  static const remove_from_suggestion = "/remove";
  static const get_all_friends = "/friends/all-friends";
  static const friend_request = "/friends/friend-request";
  static const my_friends = "/friends/friends";
  static const send_request = "/friends/friend-request";
  static const removed_friend = "/friends/remove-friend";
  static const accept_request = "/friends/accept-request";
  static const cancel_request = "/friends/cancel-request";
  static const remove_request = "/friends/remove-request";
  static const remove_friend = "/friends/remove-friend";
  static const create_group = "/group";
  static const get_group = "/group";
  static const removed_group_member = "/group/remove-member";
  static const add_group_member = "/group/add-member";

  static String getFriendsProfile(var id) => "/friends/friend-profile/$id";

///===================== Goal =======================
  static const add_goal = "/goal";
  static const fetch_goal = "/goal";
  static String deleteGoal(var id) => "/goal/$id";

///===================== Menu==========
  static const term_conditions = "/rule/terms-and-conditions";
  static const about = "/rule/about";
  static const faq = "/faq";
  static const disclaimer = "/disclaimer";
  static const privacy_policy = "/rule/privacy-policy";
  static const app_support = "/rule/appAndSupport";

///===================== Avatar ====================
  static const my_avatar = "/transaction";
  static const buy_avatar = "/transaction";

///====================== Chat =================
  static const create_chat = "/chat";
  static const chat_list = "/chat";
  static const send_message = "/message";
  static String getMessage(var chatId) => "/message/$chatId";

///========================= Notification ===============
  static const getNotification = "/notification";

///=============== Activity and challenge ================
  static const getLastChellenge = "/activity/challenges/latest";
  static const dayChallenges = "/activity/challenges/dayFilter";
  static const dailyUpdate = "/activity/today-total";


  static const todayActivity = "/activity/latest";
  static const todayPercentage = "/activity/total-day-parcentage";
  static const createActivity = "/activity/create";
  static const weeklyStaticstics = "/activity/weekly-stat";
  static const userLifeTimeActivity = "/activity/lifetime-stat";


///=============== Map ================
  static String getNearByUser(var lng, var lat) => "/user/nearby-users?latitude=$lat&longitude=$lng";


  ///=============== Activity and challenge ================
  static const createChallenge = "/activity/challenges";


  ///=============== Report ======================
  static const report = "/report";

  ///=============== Delete post =================
  static String deletePost(var postId) => "/post/$postId";

}
