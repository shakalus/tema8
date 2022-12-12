part of 'index.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    required String title,
    required int year,
    required num rating,
    required int runtime,
    required String summary,
    @JsonKey(name: 'medium_cover_image') required String mediumImage,
    @JsonKey(name: 'large_cover_image') required String largeImage,
    required List<Torrent> torrents,
  }) = Movie$;

  factory Movie.fromJson(Map<dynamic, dynamic> json) => _$MovieFromJson(Map<String, dynamic>.from(json));
}
