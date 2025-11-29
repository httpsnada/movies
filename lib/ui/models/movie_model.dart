class Movie {
  final String id;
  final String title;
  final String image;
  final double rating;

  Movie({
    required this.id,
    required this.title,
    required this.image,
    required this.rating,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json["_id"] ?? "",
      title: json["title"] ?? "",
      image: json["poster"] ?? "",
      rating: (json["rating"] ?? 0).toDouble(),
    );
  }
}
