import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean/domain/movie/usecases/get_trending_movies.dart';
import 'package:tmdb_clean/domain/tv/usecases/get_trending_tv.dart';
import 'package:tmdb_clean/presentation/home/bloc/trending_state.dart';
import 'package:tmdb_clean/presentation/home/bloc/trending_tv_state.dart';
import 'package:tmdb_clean/service_locator.dart';

class TrendingTVCubit extends Cubit<TrendingTVState> {
  TrendingTVCubit() : super(TrendingTvLoading());

  void getTrendingTv() async {
    var returnedData = await sl<GetTrendingTvUseCase>().call(false);

    returnedData.fold(
      (error) => emit(TrendingTvFailure(errorMessage: error['message'])),
      (data) => emit(TrendingTvLoaded(tv: data)),
    );
  }
}
