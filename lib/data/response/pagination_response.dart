import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_response.freezed.dart';
part 'pagination_response.g.dart';

@freezed
class PaginationResponse with _$PaginationResponse {
  const factory PaginationResponse({
    @JsonKey(name: 'current_page') @Default(-1) int currentPage,
    @JsonKey(name: 'last_page') @Default(-1) int lastPage,
    @JsonKey(name: 'per_page') @Default(-1) int perPage,
    @JsonKey(name: 'total') @Default(-1) int total,
  }) = _PaginationResponse;

  factory PaginationResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginationResponseFromJson(json);
}
