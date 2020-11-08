class MovieModelResults{
  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  String title;
  double voteAvarage;
  String overview;
  String releaseDate;

  MovieModelResults(
      this.popularity,
      this.voteCount,
      this.video,
      this.posterPath,
      this.id,
      this.adult,
      this.backdropPath,
      this.originalLanguage,
      this.originalTitle,
      this.title,
      this.voteAvarage,
      this.overview,
      this.releaseDate);
}