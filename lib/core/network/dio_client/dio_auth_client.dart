import 'package:dio/dio.dart';
import '../api_constants.dart';
import 'dio_interceptors.dart';

class DioAuthClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.authBaseUrl,
      headers: {'Content-Type': 'application/json'},
    ),
  )..interceptors.add(AuthInterceptor());
}
