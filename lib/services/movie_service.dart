import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_starter/models/movie_model.dart';

class MovieService {
  Future<List<Movie>> fetchMovies(int page) async {
    final response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=$page'),
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0OWE1NDUwOTNiNWE3ODQ5ODc3YzE2OWFiNjAwNzUxNSIsIm5iZiI6MTcyMTM3MjU4OS4xODczNTUsInN1YiI6IjViZTUzOWYzYzNhMzY4MTBkMjAzZGYzNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ijCkX0NChzfed5_fWdQGkfaLQlZrB4x9NPA6A4T_Q_E',
        'accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      final List result = responseBody['results'];
      return result.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load : ${response.statusCode}");
    }
  }
}
