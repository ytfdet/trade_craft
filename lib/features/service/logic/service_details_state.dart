

import 'package:freezed_annotation/freezed_annotation.dart';
part 'service_details_state.freezed.dart';
@freezed

class ServiceDetailsState<T> with _$ServiceDetailsState<T>{
  const factory ServiceDetailsState.initial() = _Initial;
  const factory ServiceDetailsState.loading() = Loading;
  const factory ServiceDetailsState.success() = Success;
  const factory ServiceDetailsState.error({required String error}) = Error;

}
