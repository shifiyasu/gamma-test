import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gamma_test/data.dart';
import 'package:gamma_test/models/film.dart';
import 'package:gamma_test/models/series.dart';

part 'movies_state.dart';
part 'movies_cubit.freezed.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(const MoviesState.initial()) {
    loadMovies();
  }

  Future<void> loadMovies() async {
    emit(const MoviesState.loading());

    //simulating a network call
    await Future.delayed(
      const Duration(seconds: 2),
    );
    try {
      final List<Film> allFilms =
          allFilmsJson.map((e) => Film.fromJson(e)).toList();
      final List<Series> allSeries =
          allSeriesJson.map((e) => Series.fromJson(e)).toList();

      emit(
        MoviesState.loaded(allFilms: allFilms, allSeries: allSeries),
      );
    } catch (e, s) {
      debugPrintStack(stackTrace: s, label: e.toString());
      inspect(e);
      emit(
        MoviesState.failed(
          stacktrace: e.toString(),
        ),
      );
    }
  }
}
