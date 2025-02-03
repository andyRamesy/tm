import '../../../domain/movie/entities/movie.dart';

abstract class NowPlayingState{}

class NowPlayingMoviesLoading extends NowPlayingState {}

class TrendingMoviesLoaded extends NowPlayingState {
  final List<MovieEntity>? movies;

  TrendingMoviesLoaded({required this.movies});
}

class TrendingMoviesFailure extends NowPlayingState {
  final String errorMessage;

  TrendingMoviesFailure({required this.errorMessage});
}
