class ApiUrl {
  static const String baseUrl = 'http://192.168.1.154:3000/';
  static const String apiVersion = 'api/v1/';
  static const String signup = '${apiVersion}auth/signup';
  static const String login = '${apiVersion}auth/signin';
  static const String logout = '${apiVersion}auth/logout';
  static const String trendingMovies = '${apiVersion}movie/trending';
}
