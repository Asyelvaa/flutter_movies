class Result {
  String? title;
  String? posterPath;
  String? backdropPath;
  String? releaseDate;
  String? overview;
  double? voteAverage;
  List<int>? genreIds;

  Result({
    this.title,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
    this.overview,
    this.voteAverage,
    this.genreIds,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      title: json['title'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      releaseDate: json['release_date'],
      overview: json['overview'],
      voteAverage: json['vote_average'].toDouble(),
      genreIds: json['genre_ids'].cast<int>(),
    );
  }
  
}