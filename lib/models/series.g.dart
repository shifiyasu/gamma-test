// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeriesImpl _$$SeriesImplFromJson(Map<String, dynamic> json) => _$SeriesImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      numberOfSeasons: json['numberOfSeasons'] as int,
      numberOfEpisodesPerSeason: json['numberOfEpisodesPerSeason'] as int,
    );

Map<String, dynamic> _$$SeriesImplToJson(_$SeriesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'numberOfSeasons': instance.numberOfSeasons,
      'numberOfEpisodesPerSeason': instance.numberOfEpisodesPerSeason,
    };
