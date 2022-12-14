// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: always_specify_types

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Movie$ _$$Movie$FromJson(Map<String, dynamic> json) => _$Movie$(
      id: json['id'] as int,
      title: json['title'] as String,
      year: json['year'] as int,
      rating: json['rating'] as num,
      runtime: json['runtime'] as int,
      summary: json['summary'] as String,
      mediumImage: json['medium_cover_image'] as String,
      largeImage: json['large_cover_image'] as String,
      torrents: (json['torrents'] as List<dynamic>)
          .map((e) => Torrent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$Movie$ToJson(_$Movie$ instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'year': instance.year,
      'rating': instance.rating,
      'runtime': instance.runtime,
      'summary': instance.summary,
      'medium_cover_image': instance.mediumImage,
      'large_cover_image': instance.largeImage,
      'torrents': instance.torrents,
    };

_$Torrent$ _$$Torrent$FromJson(Map<String, dynamic> json) => _$Torrent$(
      url: json['url'] as String,
      hash: json['hash'] as String,
      quality: json['quality'] as String,
      type: json['type'] as String,
      size: json['size'] as String,
    );

Map<String, dynamic> _$$Torrent$ToJson(_$Torrent$ instance) =>
    <String, dynamic>{
      'url': instance.url,
      'hash': instance.hash,
      'quality': instance.quality,
      'type': instance.type,
      'size': instance.size,
    };

_$AppState$ _$$AppState$FromJson(Map<String, dynamic> json) => _$AppState$(
      movies: (json['movies'] as List<dynamic>?)
              ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Movie>[],
      liked: (json['liked'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          const <int>[],
      isLoading: json['isLoading'] as bool? ?? true,
      selectedMovie: json['selectedMovie'] == null
          ? null
          : Movie.fromJson(json['selectedMovie'] as Map<String, dynamic>),
      page: json['page'] as int? ?? 1,
    );

Map<String, dynamic> _$$AppState$ToJson(_$AppState$ instance) =>
    <String, dynamic>{
      'movies': instance.movies,
      'liked': instance.liked,
      'isLoading': instance.isLoading,
      'selectedMovie': instance.selectedMovie,
      'page': instance.page,
    };
