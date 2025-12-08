import 'package:dio/dio.dart';
import 'package:movies/core/network/api_exceptions.dart';
import 'dio_client/dio_interceptors.dart';

class ApiService {
  final DioClient _dioClient = DioClient();

  ///CRUD METHODS

  /// GET
  Future<dynamic> getRequest(String endpoint) async {
    try {
      final response = await _dioClient.dio.get(endpoint);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

  /// POST
  Future<dynamic> PostRequest(
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await _dioClient.dio.post(endpoint, data: body);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

  /// PUT//update
  Future<dynamic> putRequest(String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await _dioClient.dio.put(endpoint, data: body);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

  /// DELETE
  Future<dynamic> deleteRequest(String endpoint) async {
    try {
      final response = await _dioClient.dio.delete(endpoint);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }
}
