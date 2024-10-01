import 'pagination_response.dart';

class NetworkResponse<T> {
  final T data;
  final PaginationResponse? pagination;

  NetworkResponse(this.data, {this.pagination});
}
