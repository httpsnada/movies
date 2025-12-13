import 'package:dio/dio.dart';
import 'api_exceptions.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  /// GET
  Future<dynamic> getRequest(String endpoint) async {
    try {
      final response = await dio.get(endpoint);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

  /// POST
  Future<dynamic> PostRequest(String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await dio.post(endpoint, data: body);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

  /// PUT
  Future<dynamic> putRequest(String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await dio.put(endpoint, data: body);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

  /// DELETE
  Future<dynamic> deleteRequest(String endpoint) async {
    try {
      final response = await dio.delete(endpoint);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }
}
