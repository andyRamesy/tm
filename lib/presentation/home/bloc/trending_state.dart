import 'package:tmdb_clean/domain/movie/entities/movie.dart';

abstract class TrendingState {}

class TrendingMoviesLoading extends TrendingState {}

class TrendingMoviesLoaded extends TrendingState {
  final List<MovieEntity> movies;

  TrendingMoviesLoaded({required this.movies});
}

class TrendingMoviesFailure extends TrendingState {
  final String errorMessage;

  TrendingMoviesFailure({required this.errorMessage});
}
