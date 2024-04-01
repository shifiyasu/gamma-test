import 'package:freezed_annotation/freezed_annotation.dart';

part 'series.freezed.dart';
part 'series.g.dart';

//highly simplified version of a potential Series model
@freezed
class Series with _$Series {
  const factory Series({
    required int id,
    required String name,
    required String imageUrl,
    required int numberOfSeasons,
    required int numberOfEpisodesPerSeason,
  }) = _Series;

  factory Series.fromJson(Map<String, dynamic> json) => _$SeriesFromJson(json);
}
