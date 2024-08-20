class Movie{
  late String title;
  String? posterLink;
  DateTime? releaseDate;
  late String overView;
  double voteAverage = -1;
  String? homePage = '';
  int? runTime = -1;

  Movie({
    required this.title,
    String? posterLink,
    String? releaseDate,
    required this.overView,
    required this.voteAverage,
    this.homePage,
    this.runTime,
  }) : releaseDate = (releaseDate != null && releaseDate.isNotEmpty)
      ? DateTime.parse(releaseDate)
      : null,
        posterLink = (posterLink != null && posterLink.isNotEmpty)
      ? 'https://image.tmdb.org/t/p/w500$posterLink'
      : null;
}