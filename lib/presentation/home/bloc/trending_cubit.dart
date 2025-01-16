import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean/domain/movie/usecases/get_trending_movies.dart';
import 'package:tmdb_clean/presentation/home/bloc/trending_state.dart';
import 'package:tmdb_clean/service_locator.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingMoviesLoading());

  void getTrendingMovies() async {
    var movies = await sl<GetTrendingMoviesUseCase>().call(false);
    movies.fold(
      (error) => emit(TrendingMoviesFailure(errorMessage: error)),
      (data) => emit(TrendingMoviesLoaded(movies: data)),
    );
    // final result = await GetTrendingMoviesUseCase().call(NoParams());
    // result.fold(
    //   (error) => emit(TrendingMoviesFailure(errorMessage: error.toString())),
    //   (data) => emit(TrendingMoviesLoaded(movies: data)),
    // );
  }
}
