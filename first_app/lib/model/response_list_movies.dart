class ResponseListTrendingMovies {
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  ResponseListTrendingMovies({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory ResponseListTrendingMovies.fromJson(Map<String, dynamic> json) {
    return ResponseListTrendingMovies(
      page: json['page'] ?? 0,
      results: (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e))
          .toList(),
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'] ?? 0,
    );
  }
}

class Movie {
  final bool adult;
  final String? backdropPath;
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String? posterPath;
  final String mediaType;
  final String originalLanguage;
  final List<int> genreIds;
  final double popularity;
  final String? releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Movie({
    required this.adult,
    this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    this.posterPath,
    required this.mediaType,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'],
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'],
      mediaType: json['media_type'] ?? '',
      originalLanguage: json['original_language'] ?? '',
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      popularity: (json['popularity'] ?? 0).toDouble(),
      releaseDate: json['release_date'],
      video: json['video'] ?? false,
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
    );
  }
}
