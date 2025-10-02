class ApiUrls {
  // Base URL and other constant URLs
  static const String baseUrl = "https://api.tekqlous.com/api/";
  static const String socketUrl = "https://api.tekqlous.com";

  // Define endpoints for users, guardians, etc.
  String register = "${baseUrl}user/register";
  String verify_otp = "${baseUrl}user/verify_otp";
  String logout = "${baseUrl}user/logout";
  String soshistory = "${baseUrl}user/history";
  String usergooglelogin = "${baseUrl}user/google_login";
  String uploadImage = "${baseUrl}upload_image";  
}