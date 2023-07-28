class HttpUrl {
  /// Api Url
  static const String baseUrl = 'https://api.spacexdata.com/';

  /// Api Key
  static const String apiKey = '';

  /// Secret Key
  static const String secretKey = '';

  ///  Login Url
  static const loginUrl = '';

  /// Register Url
  static const registerUrl = '';

  ///  Home sayfasındaki dashboard
  static const homeUrl = "home.json";
  static dashboardUrl(int ownerId) =>
      'home/$ownerId';

}
