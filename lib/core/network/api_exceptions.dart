import 'package:dio/dio.dart';
import 'api_error.dart';

class ApiExceptions {
  static ApiError handleError(DioException error) {

    switch (error.type) {
      case DioExceptionType.cancel:
        return ApiError(message: "Request to API server was cancelled");

      case DioExceptionType.connectionTimeout:
        return ApiError(message: "Connection timeout with API server");

      case DioExceptionType.receiveTimeout:
        return ApiError(
          message: "Receive timeout in connection with API server",
        );

      case DioExceptionType.sendTimeout:
        return ApiError(message: "Send timeout in connection with API server");

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message =
            error.response?.data['message'] ??
                'Received invalid status code: $statusCode';
        return ApiError(message: message, statusCode: statusCode);

      case DioExceptionType.badCertificate:
        return ApiError(message: "Bad certificate from server");

      case DioExceptionType.connectionError:
        return ApiError(message: "Failed to connect to the server");

      case DioExceptionType.unknown:
        return ApiError(message: "Unexpected error occurred");
    }
  }
}
