import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String baseUrl = '${dotenv.env['SERVER_URL']}/api/v1';

  //auth
  static String login = "$baseUrl/auth/login";
  static String socialLogin = "$baseUrl/auth/socialLogin";
  static String logout = "$baseUrl/auth/logout";
  static String refreshToken = "$baseUrl/auth/refresh";
  static String signup = "$baseUrl/auth/signup";
  static String socialSignup = "$baseUrl/auth/socialSignup";
  static String forgotPassword = "$baseUrl/auth/forgotPassword";
  static String resetPassword = "$baseUrl/auth/resetPassword";

  //crypto
  static String getOverview = "$baseUrl/crypto/overview";
  static String getCoins = "$baseUrl/crypto/coins";

  //news
  static String getNews = "$baseUrl/news";

  //search
  static String searchCrypto = "$baseUrl/search";

  //profile
  static String getProfile = "$baseUrl/profile";
}

enum SocialProvider<String> { google, facebook, apple }
