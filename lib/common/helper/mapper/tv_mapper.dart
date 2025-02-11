import 'package:tmdb_clean/data/tv/models/tv.dart';
import 'package:tmdb_clean/domain/tv/entities/TVEntity.dart';

class TVMapper {
  static TVEntity toEntity(TVModel tvmodel) {
    return TVEntity(
        backdropPath: tvmodel.backdropPath,
        id: tvmodel.id,
        name: tvmodel.name,
        originalName: tvmodel.originalName,
        overview: tvmodel.overview,
        posterPath: tvmodel.posterPath,
        mediaType: tvmodel.mediaType,
        adult: tvmodel.adult,
        originalLanguage: tvmodel.originalLanguage,
        genreIds: tvmodel.genreIds,
        popularity: tvmodel.popularity,
        firstAirDate: tvmodel.firstAirDate,
        voteAverage: tvmodel.voteAverage,
        voteCount: tvmodel.voteCount,
        originCountry: tvmodel.originCountry);
  }
}
