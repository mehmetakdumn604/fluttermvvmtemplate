class BaseError<T> implements Exception {
  BaseError(this.message);
  final String message;
}