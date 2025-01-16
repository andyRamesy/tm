import 'package:dartz/dartz.dart';
import 'package:tmdb_clean/core/usecase/usecase.dart';
import 'package:tmdb_clean/domain/movie/repositories/movie.dart';
import 'package:tmdb_clean/service_locator.dart';

class GetTrendingMoviesUseCase extends UseCase<Either,dynamic> {
  @override
  Future<Either> call(params)async {
    return await sl<MovieRepository>().getTrendingMovies();
  }
  
}