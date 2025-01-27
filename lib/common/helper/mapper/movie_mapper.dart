import 'package:tmdb_clean/domain/movie/entities/movie.dart';

class MovieMapper {
  static MovieEntity toEntity(MovieEntity movie) {
    return MovieEntity(
        id: movie.id,
        title: movie.title,
        originalTitle: movie.originalTitle,
        overview: movie.overview,
        originalLanguage: movie.originalLanguage,
        genreIds: movie.genreIds,
        popularity: movie.popularity,
        releaseDate: movie.releaseDate,
        voteAverage: movie.voteAverage,
        voteCount: movie.voteCount,
        adult: movie.adult,
        video: movie.video,
        posterPath: movie.posterPath);
  }
}
