import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/profile_response.dart';

part 'profile_state.freezed.dart';
@freezed
class ProfileState<T> with _$ProfileState<T> {
  const factory ProfileState.initial() = _ProfileInitial;
  const factory ProfileState.loading() = ProfileLoading;
  const factory ProfileState.loaded(T data) = ProfileLoaded<T>;
  const factory ProfileState.error({required String error}) = Error;
}