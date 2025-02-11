import 'package:tmdb_clean/domain/movie/entities/movie.dart';
import 'package:tmdb_clean/domain/tv/entities/TVEntity.dart';

abstract class TrendingTVState {}

class TrendingTvLoading extends TrendingTVState {}

class TrendingTvLoaded extends TrendingTVState {
  final List<TVEntity> tv;

  TrendingTvLoaded({required this.tv});
}

class TrendingTvFailure extends TrendingTVState {
  final String errorMessage;

  TrendingTvFailure({required this.errorMessage});
}
