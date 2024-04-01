part of 'movies_cubit.dart';

@freezed
class MoviesState with _$MoviesState {
  const factory MoviesState.initial() = _Initial;
  const factory MoviesState.loading() = _Loading;
  const factory MoviesState.loaded(
      {required List<Film> allFilms,
      required List<Series> allSeries}) = _Loaded;
  const factory MoviesState.failed({required String stacktrace}) = _Failed;
}
