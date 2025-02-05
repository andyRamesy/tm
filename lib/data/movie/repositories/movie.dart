import 'package:dartz/dartz.dart';
import 'package:tmdb_clean/common/helper/mapper/movie_mapper.dart';
import 'package:tmdb_clean/data/movie/models/movie.dart';
import 'package:tmdb_clean/data/movie/sources/movie.dart';
import 'package:tmdb_clean/domain/movie/repositories/movie.dart';
import 'package:tmdb_clean/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    var returnedData = await sl<MovieService>().getTrendingMovies();

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies =
          List.from(data['data']).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getNowPlayingMovies() async{
    var returnedData = await sl<MovieService>().getNowPlayingMovies();

    return returnedData.fold((error){
      return Left(error);
    }, (data){
      var nowPlayingMovies = List.from(data['data']['results']).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
      return Right(nowPlayingMovies);
    });
  }
}
