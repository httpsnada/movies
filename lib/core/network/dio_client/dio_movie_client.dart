import 'package:dio/dio.dart';
import '../api_constants.dart';

class DioMovieClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.moviesBaseUrl,
      headers: {'Content-Type': 'application/json'},
    ),
  );
}
