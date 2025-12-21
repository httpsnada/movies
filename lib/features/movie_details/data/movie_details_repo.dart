import '../../../../../../core/network/api_constants.dart';
import '../../../../../../core/network/api_service.dart';
import '../../../../../../core/network/dio_client/dio_movie_client.dart';
import 'movie_details_model.dart';

class MoviesDetailsRepo {
  ApiService _apiService = ApiService(DioMovieClient.dio);

  //get movie
  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    try {
      final response = await _apiService.getRequest(
        ApiConstants.movieDetailsEndPoint,
        queryParameters: {'movie_id': movieId, 'with_images': true},
      );
      final movieJson = response['data']['movie'];
      return MovieDetailsModel.fromJson(movieJson);
    } catch (e) {
      throw Exception('Failed to load movie details');
    }
  }
}
