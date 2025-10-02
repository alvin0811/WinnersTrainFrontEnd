class AppException implements Exception {
  final String? _message;
  final String? _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, 'Fetch Data Error:');
}
class AuthenticationException extends AppException {
  AuthenticationException([String? message]) : super(message, 'Authentication Error:');
}
class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Bad Request Error:');
}
class NotFoundException extends AppException {
  NotFoundException([String? message]) : super(message, 'Not Found Error:');
}
class UnauthorizedException extends AppException {
  UnauthorizedException([String? message]) : super(message, 'Unauthorized Error:');
}
class InternalServerErrorException extends AppException {
  InternalServerErrorException([String? message]) : super(message, 'Internal Server Error');
}



