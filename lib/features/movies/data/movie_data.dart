class MovieData {
  MovieData({
    required this.image,
    required this.title,
    required this.description,
    required this.rating,
    required this.duration,
    required this.summary,
    required this.genres,
    required this.state,
    required this.screenShoots,
    required this.cast,
  });

  final String image;
  final String title;
  final String description;
  final String rating;
  final String duration;
  final String summary;
  final List<String> genres;
  final String state;
  final List<String> screenShoots;
  final List<String> cast;
}
