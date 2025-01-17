import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean/domain/movie/usecases/get_trending_movies.dart';
import 'package:tmdb_clean/presentation/home/bloc/trending_state.dart';
import 'package:tmdb_clean/service_locator.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingMoviesLoading());

  void getTrendingMovies() async {
    var returnedData = await sl<GetTrendingMoviesUseCase>().call(false);

    returnedData.fold(
      (error) => emit(TrendingMoviesFailure(errorMessage: error)),
      (data) => emit(TrendingMoviesLoaded(movies: data)),
    );
  }
}
