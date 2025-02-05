import '../../../domain/movie/entities/movie.dart';

abstract class NowPlayingState{}

class NowPlayingMoviesLoading extends NowPlayingState {}

class NowPlayingMoviesLoaded extends NowPlayingState {
  final List<MovieEntity>? movies;

  NowPlayingMoviesLoaded({required this.movies});
}

class NowPlayingMoviesFailure extends NowPlayingState {
  final String errorMessage;

  NowPlayingMoviesFailure({required this.errorMessage});
}
