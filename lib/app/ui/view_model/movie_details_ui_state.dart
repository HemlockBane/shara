import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../../../core/data/model/movie.dart';

part 'movie_details_ui_state.freezed.dart';

@freezed
class MovieDetailsUiState with _$MovieDetailsUiState {
  const factory MovieDetailsUiState.success({required Movie? data}) = Success;
  const factory MovieDetailsUiState.loading() = Loading;
  const factory MovieDetailsUiState.failed([String? message]) = Failed;
}
