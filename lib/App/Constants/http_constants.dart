class HttpUrl {
  /// Api Url
  static const String baseUrl = 'https://api.spacexdata.com/';

  /// Api Key
  static const String apiKey = '';

  /// Secret Key
  static const String secretKey = '';

  /// RocketList
  static const String rocketList = 'v4/launches';

  /// Delete Rocket 
  static String deleteRocket(String rocketId) => '/$rocketId';

  ///  Home sayfasındaki dashboard
  static const homeUrl = "home.json";
  static dashboardUrl(int ownerId) =>
      'home/$ownerId';

}
