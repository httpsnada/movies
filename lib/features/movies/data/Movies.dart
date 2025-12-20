/// id : 73143
/// url : "https://yts.lt/movies/forty-seven-days-with-jesus-2024?T4bmloTLHqmHBLQRSGIFYUC-4h95xOT3uMxFb3USsbHgFA"
/// imdb_code : "tt27691828"
/// title : "Forty-Seven Days with Jesus"
/// title_english : "Forty-Seven Days with Jesus"
/// title_long : "Forty-Seven Days with Jesus (2024)"
/// slug : "forty-seven-days-with-jesus-2024"
/// year : 2024
/// rating : 5.6
/// runtime : 135
/// genres : ["Drama"]
/// summary : ""
/// description_full : ""
/// synopsis : ""
/// yt_trailer_code : "gtDfKf7RALY"
/// language : "en"
/// mpa_rating : ""
/// background_image : "https://yts.lt/assets/images/movies/forty_seven_days_with_jesus_2024/background.jpg"
/// background_image_original : "https://yts.lt/assets/images/movies/forty_seven_days_with_jesus_2024/background.jpg"
/// small_cover_image : "https://yts.lt/assets/images/movies/forty_seven_days_with_jesus_2024/small-cover.jpg"
/// medium_cover_image : "https://yts.lt/assets/images/movies/forty_seven_days_with_jesus_2024/medium-cover.jpg"
/// large_cover_image : "https://yts.lt/assets/images/movies/forty_seven_days_with_jesus_2024/large-cover.jpg"

class MoviesModel {
  MoviesModel({
    this.id,
    this.url,
    this.imdbCode,
    this.title,
    this.titleEnglish,
    this.titleLong,
    this.slug,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.summary,
    this.descriptionFull,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.largeCoverImage,
  });

  MoviesModel.fromJson(dynamic json) {
    id = json['id'];
    url = json['url'];
    imdbCode = json['imdb_code'];
    title = json['title'];
    titleEnglish = json['title_english'];
    titleLong = json['title_long'];
    slug = json['slug'];
    year = json['year'];
    rating = json['rating'];
    runtime = json['runtime'];
    genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    summary = json['summary'];
    descriptionFull = json['description_full'];
    ytTrailerCode = json['yt_trailer_code'];
    language = json['language'];
    mpaRating = json['mpa_rating'];
    backgroundImage = json['background_image'];
    backgroundImageOriginal = json['background_image_original'];
    smallCoverImage = json['small_cover_image'];
    mediumCoverImage = json['medium_cover_image'];
    largeCoverImage = json['large_cover_image'];
  }

  num? id;
  String? url;
  String? imdbCode;
  String? title;
  String? titleEnglish;
  String? titleLong;
  String? slug;
  num? year;
  num? rating;
  num? runtime;
  List<String>? genres;
  String? summary;
  String? descriptionFull;
  String? ytTrailerCode;
  String? language;
  String? mpaRating;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  String? largeCoverImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['url'] = url;
    map['imdb_code'] = imdbCode;
    map['title'] = title;
    map['title_english'] = titleEnglish;
    map['title_long'] = titleLong;
    map['slug'] = slug;
    map['year'] = year;
    map['rating'] = rating;
    map['runtime'] = runtime;
    map['genres'] = genres;
    map['summary'] = summary;
    map['description_full'] = descriptionFull;
    map['yt_trailer_code'] = ytTrailerCode;
    map['language'] = language;
    map['mpa_rating'] = mpaRating;
    map['background_image'] = backgroundImage;
    map['background_image_original'] = backgroundImageOriginal;
    map['small_cover_image'] = smallCoverImage;
    map['medium_cover_image'] = mediumCoverImage;
    map['large_cover_image'] = largeCoverImage;
    return map;
  }
}
