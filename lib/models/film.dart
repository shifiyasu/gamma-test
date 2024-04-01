import 'package:freezed_annotation/freezed_annotation.dart';

part 'film.freezed.dart';
part 'film.g.dart';

//highly simplified version of a potential Film model
@freezed
class Film with _$Film {
  const factory Film({
    required int id,
    required String name,
    required String imageUrl,
  }) = _Film;

  factory Film.fromJson(Map<String, dynamic> json) => _$FilmFromJson(json);
}
