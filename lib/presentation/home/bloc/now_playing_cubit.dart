import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:tmdb_clean/domain/movie/usecases/get_trending_movies.dart';
import 'package:tmdb_clean/presentation/home/bloc/now_playing_state.dart';
import 'package:tmdb_clean/presentation/home/bloc/trending_state.dart';
import 'package:tmdb_clean/service_locator.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingMoviesLoading());

  void getNowPlayingMovies() async {
    var returnedData = await sl<GetNowPlayingMoviesUseCase>().call(false);

    returnedData.fold(
          (error) => emit(NowPlayingMoviesFailure(errorMessage: error['message'])),
          (data) => emit(NowPlayingMoviesLoaded(movies: data)),
    );
  }
}
