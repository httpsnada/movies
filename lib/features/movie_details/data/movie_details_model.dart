class MovieDetailsModel {
  int? id;
  String? url;
  String? imdbCode;
  String? title;
  String? titleEnglish;
  String? titleLong;
  String? slug;
  int? year;
  double? rating;
  int? runtime;
  List<String>? genres;
  int? likeCount;
  String? descriptionIntro;
  String? descriptionFull;
  String? ytTrailerCode;
  String? language;
  String? mpaRating;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  String? largeCoverImage;
  String? mediumScreenshotImage1;
  String? mediumScreenshotImage2;
  String? mediumScreenshotImage3;
  String? largeScreenshotImage1;
  String? largeScreenshotImage2;
  String? largeScreenshotImage3;

  MovieDetailsModel({
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
    this.likeCount,
    this.descriptionIntro,
    this.descriptionFull,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.mediumScreenshotImage1,
    this.mediumScreenshotImage2,
    this.mediumScreenshotImage3,
    this.largeScreenshotImage1,
    this.largeScreenshotImage2,
    this.largeScreenshotImage3,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        id: json['id'] as int?,
        url: json['url'] as String?,
        imdbCode: json['imdb_code'] as String?,
        title: json['title'] as String?,
        titleEnglish: json['title_english'] as String?,
        titleLong: json['title_long'] as String?,
        slug: json['slug'] as String?,
        year: json['year'] as int?,
        rating: (json['rating'] as num?)?.toDouble(),
        runtime: json['runtime'] as int?,
        genres: (json['genres'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        likeCount: json['like_count'] as int?,
        descriptionIntro: json['description_intro'] as String?,
        descriptionFull: json['description_full'] as String?,
        ytTrailerCode: json['yt_trailer_code'] as String?,
        language: json['language'] as String?,
        mpaRating: json['mpa_rating'] as String?,
        backgroundImage: json['background_image'] as String?,
        backgroundImageOriginal: json['background_image_original'] as String?,
        smallCoverImage: json['small_cover_image'] as String?,
        mediumCoverImage: json['medium_cover_image'] as String?,
        largeCoverImage: json['large_cover_image'] as String?,
        mediumScreenshotImage1: json['medium_screenshot_image1'] as String?,
        mediumScreenshotImage2: json['medium_screenshot_image2'] as String?,
        mediumScreenshotImage3: json['medium_screenshot_image3'] as String?,
        largeScreenshotImage1: json['large_screenshot_image1'] as String?,
        largeScreenshotImage2: json['large_screenshot_image2'] as String?,
        largeScreenshotImage3: json['large_screenshot_image3'] as String?,
      );
}
