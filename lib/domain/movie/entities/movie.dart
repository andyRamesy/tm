class MovieEntity {
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String? backdropPath;
  final String? posterPath;
  final String originalLanguage;
  final List<int> genreIds;
  final double popularity;
  final String releaseDate;
  final double voteAverage;
  final int voteCount;
  final bool adult;
  final bool video;
  final String? mediaType;

  MovieEntity({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    this.backdropPath,
    this.posterPath,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.adult,
    required this.video,
    this.mediaType,
  });
}