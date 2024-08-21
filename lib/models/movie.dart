class Movie{
  late String title;
  String? posterLink;
  String? backLink;
  DateTime? releaseDate;
  late String overView;
  double voteAverage = -1;
  int voteCount = 0;
  String? homePage = '';
  int? runTime = -1;

  Movie({
    required this.title,
    String? posterLink,
    String? backLink,
    String? releaseDate,
    required this.overView,
    required this.voteAverage,
    required this.voteCount,
    this.homePage,
    this.runTime,
  }) : releaseDate = (releaseDate != null && releaseDate.isNotEmpty)
      ? DateTime.parse(releaseDate)
      : null,
        posterLink = (posterLink != null && posterLink.isNotEmpty)
      ? 'https://image.tmdb.org/t/p/w500$posterLink'
      : null,
        backLink = (backLink != null && backLink.isNotEmpty)
      ? 'https://image.tmdb.org/t/p/w500$backLink'
      : null;
}