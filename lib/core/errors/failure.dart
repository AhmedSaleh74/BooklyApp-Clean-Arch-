import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: "Connection timeout with the server.");

      case DioExceptionType.sendTimeout:
        return ServerFailure(message: "Send timeout, please try again.");

      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: "Receive timeout from the server.");

      case DioExceptionType.badCertificate:
        return ServerFailure(
          message: "Bad SSL Certificate — please check your connection.",
        );

      case DioExceptionType.badResponse:
        // السيرفر رجع Response فيه error code
        return ServerFailure.fromBadResponse(response: e.response);

      case DioExceptionType.cancel:
        return ServerFailure(message: "Request was cancelled.");

      case DioExceptionType.connectionError:
        return ServerFailure(
          message: "Connection error — please check your internet.",
        );

      case DioExceptionType.unknown:
        if (e.message != null && e.message!.contains('SocketException')) {
          return ServerFailure(message: "No Internet connection.");
        }
        return ServerFailure(
          message: "Unexpected error occurred. Please try again.",
        );
    }
  }

  factory ServerFailure.fromBadResponse({Response? response}) {
    if (response == null) {
      return ServerFailure(message: "No response received from server.");
    }

    switch (response.statusCode) {
      case 400:
        return ServerFailure(message: "Bad request. Please try again.");
      case 401:
        return ServerFailure(
          message: "Unauthorized request. Please login again.",
        );
      case 403:
        return ServerFailure(message: "Access forbidden.");
      case 404:
        return ServerFailure(message: "Resource not found.");
      case 500:
        return ServerFailure(message: "Internal server error.");
      case 502:
        return ServerFailure(message: "Bad gateway. Try again later.");
      case 503:
        return ServerFailure(
          message: "Service unavailable. Please try again later.",
        );
      default:
        return ServerFailure(
          message: "Unexpected server error (${response.statusCode}).",
        );
    }
  }
}
