import 'package:get_it/get_it.dart';
import 'package:tmdb_clean/core/configs/network/dio_client.dart';
import 'package:tmdb_clean/data/auth/repositories/auth/auth.dart';
import 'package:tmdb_clean/data/auth/sources/auth_api_service.dart';
import 'package:tmdb_clean/data/movie/repositories/movie.dart';
import 'package:tmdb_clean/data/movie/sources/movie.dart';
import 'package:tmdb_clean/domain/auth/repositories/auth.dart';
import 'package:tmdb_clean/domain/auth/usecases/is_logged_in.dart';
import 'package:tmdb_clean/domain/auth/usecases/signin.dart';
import 'package:tmdb_clean/domain/auth/usecases/signup.dart';
import 'package:tmdb_clean/domain/movie/repositories/movie.dart';
import 'package:tmdb_clean/domain/movie/usecases/get_trending_movies.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  //services
  sl.registerSingleton<AuthService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieService>(MovieApiServiceImpl());

  //repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());

  //usecases
  sl.registerSingleton<SingupUseCase>(SingupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
}
