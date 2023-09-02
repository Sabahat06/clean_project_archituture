class ApiUrl {
  //BASE URl
  static String baseUrl = "https://hashedscript.com/api";
  static String imageUrl = "https://hashedscript.com/storage/";

  ///INTRO SCREEN API
  static String getSports = "$baseUrl/get/sports";
  static String getLeagues = "$baseUrl/get/leagues";
  static String getTeams = "$baseUrl/get/teams";
  static String updatePreference = "$baseUrl/user/update/preference";

  ///AUTHENTICATION
  static String signUpUser = "$baseUrl/user/signup";
  static String logInUrl = "$baseUrl/user/login";
  static String passwordForgotUrl = "$baseUrl/forgot/password";
  static String profileUpdateUrl = "$baseUrl/user/update/profile";
  static String logOutUrl = "$baseUrl/logout";
  static String otpSendUrl = "$baseUrl/email/otp";
  static String otpVerifyUrl = "$baseUrl/verify/otp";
  static String changePasswordUrl = "$baseUrl/change/password";
  static String getProfile = "$baseUrl/user/profile";

  ///History
  static String getHistory = "$baseUrl/get/past/matches";

  ///Reward Claim
  static String getClaimInformation = "$baseUrl/claim/points/info";
  static String getClaim = "$baseUrl/claim/free/points";

  ///Live Match
  static String getLiveMatch = "$baseUrl/get/live/match";

  ///Point Tracker
  static String getPointTracker = "$baseUrl/get/point/balance";

  ///Wallet
  static String getWalletData = "$baseUrl/get/wallet";

  ///Upcoming
  static String getUpcomingMatches = "$baseUrl/get/upcoming/matches";
  static String getUpcomingLeagues = "$baseUrl/get/upcoming/league";

  ///PowerPlay
  static String getPowerPlay = "$baseUrl/get/matches";

  ///Player
  static String getPlayer = "$baseUrl/get/players";

  ///Update FCM Token
  static String updateFCMToken = "$baseUrl/user/update/device/token";

  ///Buy Pack
  static String getPack = "$baseUrl/get/packs";
  static String getPackages = "$baseUrl/get/packages";
  static String buyPack = "$baseUrl/buy/pack";
  static String buyPackage = "$baseUrl/buy/package";

  static String getPackBought = "$baseUrl/get/bought/packs";
  static String getUnopenedPack = "$baseUrl/get/unopened/packs";
  static String openPack = "$baseUrl/open/pack";


}
