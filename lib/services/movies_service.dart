import 'dart:convert';
import 'package:http/http.dart' as http;
import '../ui/models/movie_model.dart';

class MoviesService {
  final String baseUrl = " https://route-movie-apis.vercel.app/";

  Future<List<Movie>> getWatchList() async {
    final response = await http.get(
      Uri.parse("$baseUrl/api/v1/user/favorites"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return (data["favorites"] as List)
          .map((json) => Movie.fromJson(json))
          .toList();
    } else {
      throw Exception("Failed to load watch list");
    }
  }

  Future<void> addToWatchList(String movieId) async {
    final response = await http.post(
      Uri.parse("$baseUrl/api/v1/user/favorites"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"movieId": movieId}),
    );

    if (response.statusCode != 201) {
      throw Exception("Failed to add to watch list");
    }
  }
}
