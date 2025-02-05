class ApiUrl {
  static const String baseUrl = 'http://10.13.106.142:3000/';
  static const String apiVersion = 'api/v1/';
  static const String signup = '${apiVersion}auth/signup';
  static const String login = '${apiVersion}auth/signin';
  static const String logout = '${apiVersion}auth/logout';
  static const String trendingMovies = '${apiVersion}movie/trending';
  static const String nowPlayingMovies = '${apiVersion}/movie/nowplaying';
}
