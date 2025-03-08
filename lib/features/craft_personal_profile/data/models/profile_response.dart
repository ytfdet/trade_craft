import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_response.g.dart';
part 'profile_response.freezed.dart';

@freezed
class ProfileResponse with _$ProfileResponse {
  const factory ProfileResponse({
    @JsonKey(name: 'message') required String message,
    @JsonKey(name: 'data') required List<ProfileData> data,
    @JsonKey(name: 'status') required bool status,
    @JsonKey(name: 'code') required int code,
  }) = _ProfileResponse;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}

@freezed
class ProfileData with _$ProfileData {
  const factory ProfileData({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'phone') required String phone,
    @JsonKey(name: 'gender') required String gender,
  }) = _ProfileData;

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);
}