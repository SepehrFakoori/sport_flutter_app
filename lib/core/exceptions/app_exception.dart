import 'dart:core';

abstract class AppException implements Exception {
  final String _message;
  final StackTrace? stackTrace;

  const AppException(this._message, [this.stackTrace]);

  @override
  String toString() => '$runtimeType: $_message';
}
