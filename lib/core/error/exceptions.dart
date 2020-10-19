
import 'package:assigment/core/utils/app_strings.dart';

class AppExeptions implements Exception {
  String message;
  AppExeptions(this.message);
  @override
  String toString() {
    if (message == null) return AppStrings.unKnownError;
    return message;
  }
}

class ServerException extends AppExeptions {
  ServerException(String message) : super(message);
}

class CacheException extends AppExeptions {
  CacheException(String message) : super(message);
}

class NetworkException extends AppExeptions {
  NetworkException(String message) : super(message);
}
