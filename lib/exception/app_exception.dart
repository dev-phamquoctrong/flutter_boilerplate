abstract class AppException implements Exception {
  final Exception exception;

  AppException(this.exception);

  String get message;

  StackTrace get stackTrace => StackTrace.current;

  @override
  String toString() {
    return '$runtimeType: $message';
  }
}
