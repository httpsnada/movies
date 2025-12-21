import 'package:movies/core/network/api_constants.dart';
import 'package:movies/core/network/api_service.dart';
import 'package:movies/core/network/dio_client/dio_movie_client.dart';
import 'package:movies/features/movies/data/Movies.dart';

class MovieSuggestionsRepo {
  ApiService _apiService = ApiService(DioMovieClient.dio);

  //get movies
  Future<List<MoviesModel>> getMoviesSuggestions(int movieId) async {
    try {
      final response = await _apiService.getRequest(
        ApiConstants.movieSuggestionsEndPoint,
        queryParameters: {'movie_id': movieId},
      );

      final List moviesJson = response['data']['movies'];

      return moviesJson.map((e) => MoviesModel.fromJson(e)).toList();
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}
