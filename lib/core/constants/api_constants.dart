class ApiConstants {
  static const String baseUrl = "http://localhost/3000/api/v1";

  //auth
  static const String login = "$baseUrl/auth/login";
  static const String logout = "$baseUrl/auth/logout";
  static const String refreshToken = "$baseUrl/auth/refresh";
  static const String signup = "$baseUrl/auth/signup";
  static const String forgotPassword = "$baseUrl/auth/forgotPassword";
  static const String resetPassword = "$baseUrl/auth/resetPassword";

  //crypto
  static const String getOverview = "$baseUrl/crypto/overview";
  static const String getCoins = "$baseUrl/crypto/coins";

  //news
  static const String getNews = "$baseUrl/news";

  //search
  static const String searchCrypto = "$baseUrl/search";

  //profile
  static const String getProfile = "$baseUrl/profile";
}
