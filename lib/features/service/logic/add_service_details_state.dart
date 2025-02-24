

import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_service_details_state.freezed.dart';
@freezed

class AddServiceDetailsState<T> with _$AddServiceDetailsState<T>{
  const factory AddServiceDetailsState.initial() = _Initial;
  const factory AddServiceDetailsState.loading() = Loading;
  const factory AddServiceDetailsState.success() = Success;
  const factory AddServiceDetailsState.error({required String error}) = Error;

}
