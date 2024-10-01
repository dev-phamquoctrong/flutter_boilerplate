import 'package:flutter_boilerplate/data/response/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

@freezed
class UserResponse with _$UserResponse {
  const factory UserResponse({
    @JsonKey(name: 'current_page') @Default(-1) int currentPage,
    @JsonKey(name: 'last_page') @Default(-1) int lastPage,
    @JsonKey(name: 'per_page') @Default(-1) int perPage,
    @JsonKey(name: 'total') @Default(-1) int total,
    @JsonKey(name: 'data') @Default([]) List<User> users,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}
