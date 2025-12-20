import 'package:movies/core/network/api_constants.dart';
import 'package:movies/core/network/api_service.dart';
import 'package:movies/core/network/dio_client/dio_movie_client.dart';
import 'package:movies/features/movies/data/Movies.dart';

class MoviesRepo {
  ApiService _apiService = ApiService(DioMovieClient.dio);

  //get movies
  Future<List<MoviesModel>?> getMovies({
    int page = 1,
    String? genre,
    String? query,
  }) async {
    try {
      final response = await _apiService.getRequest(
        ApiConstants.allMoviesEndPoint,
        queryParameters: {
          'page': page,
          if (genre != null) 'genre': genre,
          if (query != null) 'query_term': query,
        },
      );

      final List moviesJson = response['data']['movies'];

      return moviesJson.map((e) => MoviesModel.fromJson(e)).toList();
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}
